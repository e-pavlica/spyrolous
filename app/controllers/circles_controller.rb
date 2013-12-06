class CirclesController < ApplicationController
  respond_to :json

  def create
    @circle = Circle.new(circle_params)
    @circle.layer_id = params[:layer_id]
    @layer = Layer.find(params[:layer_id])
    if @circle.save
      respond_with @circle do |format|
        format.json {render json: @circle }
      end
    else
      respond_with @circle.errors
    end
  end

  def destroy
    @circle = Circle.find(params[:id].to_i)
    if @circle.destroy
      respond_with @circle, status: 200
    else
      respond_with @circle, status: 500
    end
  end

  private

  def circle_params
    params.require(:circle).permit(:x,:y,:radius)
  end

end