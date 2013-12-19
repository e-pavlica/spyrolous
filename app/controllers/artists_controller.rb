class ArtistsController < ApplicationController
  def login
    artist = Artist.find_or_create_by(google_id: auth_hash['uid'])
    artist.update_attributes(artist_attributes)
    # if artist exists, log them in
    if artist
      session[:artist_id] = artist.id
      redirect_to '/dashboard'
    else
      redirect_to root_url
    end
  end

  def logout
    session[:artist_id] = nil
    redirect_to root_url
  end


  def show
    if current_user
      @artist = current_user
    else 
      redirect_to root_url
    end
    # need to show the canvases associated with each user here
    # render canvases#index as partial?
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def artist_attributes
    {
      name: request.env['omniauth.auth']['info']['name'],
      image: request.env['omniauth.auth']['info']['image']
    }
  end
end
