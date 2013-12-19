class CanvasesController < ApplicationController

  respond_to :json, :html, :svg
  def new
    @canvas = Canvas.create()
    @canvas.layers << Layer.create()
    @canvas.artists << current_user
    redirect_to canvas_path(@canvas)
  end

  def show
    @canvas = Canvas.find(params[:id])
  end


end
