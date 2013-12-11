class ArtistsController < ApplicationController

  def new
    # Initialize the client & Google Games API
    require 'google/api_client'
    require 'google/api_client/client_secrets'
    require 'google/api_client/auth/installed_app'
      
    client = Google::APIClient.new(
      :application_name => 'Spyrolous',
      :application_version => '0.0.1'
    )
    games = client.discovered_api('games','v1')

    # Initialize OAuth 2.0 client    
    client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    client.authorization.redirect_uri = 'http://localhost:3000/artists/new'
    
    client.authorization.scope = 'https://www.googleapis.com/auth/games https://www.googleapis.com/auth/appstate'

    # Request authorization
    redirect_uri = client.authorization.authorization_uri

    # Run installed application flow. Check the samples for a more
    # complete example that saves the credentials between runs.
    flow = Google::APIClient::InstalledAppFlow.new(
      :client_id => ENV['GOOGLE_CLIENT_ID'],
      :client_secret => ENV['GOOGLE_CLIENT_SECRET'],
      :scope => ['https://www.googleapis.com/auth/games']
    )
    client.authorization = flow.authorize

    @user = client.execute(
      :api_method => plus.people.get,
      :parameters => {'userId' => 'me'}
      )
  end

  def show
  end

end
