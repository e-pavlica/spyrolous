class LayersController < ApplicationController
  include ActionController::Live

  respond_to :json

  def create
    @layer = Layer.new
    @layer.canvas_id = params[:canvas_id]
    if @layer.save
      respond_with  @layer do |f|
        f.json { render json: @layer}
      end
    else 
      respond_with @layer.errors
    end
  end

  def update
    @layer = Layer.find(params[:id])
    @layer.update_attributes(layer_params)
    if @layer.save
      respond_with @layer
    else 
      respond_with @layer.errors
    end
  end

  def destroy
    Layer.destroy(params[:id])
  end

  # ActionController::Live stuff based on this blog:
  # http://blogs.sequoiainc.com/blogs/easy-streams-with-rails-4-actioncontroller-live
  def stream
    # Set the response header to keep client open
    response.headers['Content-Type'] = 'text/event-stream'
    # Define the active canvas
    @layer = Layer.find(params[:id])
    response.stream.write "event: update\n"
    response.stream.write "data:{\"data\":\"loaded layer #{params[:id]}\"} \n\n"
    begin
      loop do
        # the on_change recieves a notification whenever something is added to the layer's channel
        @layer.on_change do |data|
          # response.stream.write "id: 0\n"
          response.stream.write "event: update\n"
          # two new lines marks the end of the data for this event.
          response.stream.write "data:#{data} \n\n"
        end # canvas.layers.each

        # only send back new data every 2 seconds
        sleep 2
      end # loop
      rescue IOError
        # client disconnected.
        # .. update database streamers to remove disconnected client
      ensure
        # clean up the stream by closing it.
        response.stream.close
    end
  end

  private

  def layer_params
    params.require(:layer).permit(:fill,:stroke,:opacity)
  end


end
