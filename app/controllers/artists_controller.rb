class ArtistsController < ApplicationController
  def login
    artist = Artist.find_or_create_by(google_id: auth_hash['uid'])
    # if artist exists, log them in
    if artist
      session[:artist_id] = artist.id
      redirect_to '/dashboard'
    else
      redirect_to root
    end
  end



  def show
    @artist = current_user
    # need to show the canvases associated with each user here
    # render canvases#index as partial?
  end

  private

  def auth_hash
     request.env['omniauth.auth']
  end

end
