class CirclesController < ApplicationController
  respond_to :json
  def create
    @circle = Circle.new(circle_params)
    @circle.layer_id = params[:layer_id]
    @layer = Layer.find(params[:layer_id])
    if @circle.save
      respond_with @circle do |format|
        format.json {render json: [@layer, @circle] }
      end
    else
      respond_with @circle.errors
    end
  end

  def destroy
    
  end

  private

  def circle_params
    params.require(:circle).permit(:x,:y,:radius)
  end

end