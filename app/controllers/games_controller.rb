class GamesController < ApplicationController
  protect_from_forgery except: [:create, :update]
  respond_to :json

  def create
    @game = Game.create()
    if @game.save
      respond_with @game
    else
      respond_with @game.errors
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(:data => params[:data])
    respond_with @game do |format|
      format.json{render json: @game}
    end
  end

  def destroy

  end

  def show
    @game = Game.find(params[:id])
    respond_with @game
  end

  private

  def game_data_params
    params.require(:game).permit(:data)
  end


end
