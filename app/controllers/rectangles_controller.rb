class RectanglesController < ApplicationController
  respond_to :json

  def create
    @rectangle = Rectangle.new(rectangle_params)
    @rectangle.layer_id = params[:layer_id]
    if @rectangle.save
      respond_with @rectangle do |format|
        format.json { render json: @rectangle }
      end
    else 
      respond_with @rectangle.errors
    end
  end

  def destroy

  end

  private

  def rectangle_params
    params.require(:rectangle).permit(:x, :y, :width, :height)
  end

end
