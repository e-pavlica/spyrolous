class CanvasesController < ApplicationController

  respond_to :json, :html
  def new
    @canvas = Canvas.create()
    @canvas.layers << Layer.create()
    redirect_to canvas_path(@canvas)
  end

  def show
    @canvas = Canvas.find(params[:id])
  end

end
