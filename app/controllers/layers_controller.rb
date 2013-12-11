class LayersController < ApplicationController
respond_to :json

def create
  @layer = Layer.new
  @layer.canvas_id = params[:canvas]
  if @layer.save
    respond_with @layer
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

private

def layer_params
  params.require(:layer).permit(:fill,:stroke,:opacity)
end


end
