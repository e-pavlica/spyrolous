class SpyrosController < ApplicationController
  respond_to :json

  def create
    @spyro = Spyro.new(spyro_params)
    @spyro.layer_id = params[:layer_id]
    if @spyro.save
      respond_with @spyro do |f| 
        f.json { render json: @spyro } 
      end
    else
      respond_with @spyro.errors
    end
  end

  def destroy
    @spyro = Spyro.find(params[:id].to_i)
    if @spyro.destroy
      respond_with :ok
    else
      respond_with @spyro.errors
    end
  end

  def show
    @spyro = Spyro.find(params[:id])
    respond_with @spyro do |f|
      f.json {render json: @spyro }
    end
  end

  private

  def spyro_params
    params.require(:spyro).permit(:path, :fill, :stroke, :opacity, :stroke_width)
  end

end
