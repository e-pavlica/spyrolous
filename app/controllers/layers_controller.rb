# require 'server_side'

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

    # define the sse object.
    sse = SSE.new(response.stream, retry: 300, event: 'update')

    begin
      @layer.on_change do |data|
        sse.write({event:'update', data: JSON.parse(data)})
        # In this setup, the stream will be closed after each write
        # (partially defeating the purpose of the SSE). However,
        # this ensures that threads do not get stuck in an infinite
        # loop since we currently are not getting an IOError on client
        # disconnect. The JS on the client-side will automatically 
        # re-connect when the stream breaks, so functionality SHOULD be ok.
      end
      rescue IOError
        # Bug in Rails 4 is not throwing this error properly.
        # TODO: find alternative to IOError or invetigate fixing Rails source
        logger.info 'client disconnected.'
      ensure
        # clean up the stream by closing it.
        sse.close
    end
  end

  private

  def layer_params
    params.require(:layer).permit(:fill,:stroke,:opacity)
  end


end
