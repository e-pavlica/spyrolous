class SpyrosController < ApplicationController
  respond_to :json

  def create
    @spyro = Spyro.new
    @spyro.layer_id = params[:layer_id]
    @spyro.generate(
      params[:spyro][:x].to_f,
      params[:spyro][:y].to_f, 
      params[:spyro][:largeRadius].to_f, 
      params[:spyro][:smallRadius].to_f, 
      params[:spyro][:rho].to_f)
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
      respond_with @spyro
    else
      respond_with @spyro.errors
    end
  end

  private

  def spyro_params
    params.require(:spyro).permit(:x, :y, :largeRadius, :smallRadius, :rho)
  end

end
