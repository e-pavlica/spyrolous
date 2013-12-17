Spyrolous::Application.routes.draw do

  root "pages#index"

  # need to clean up these routes to be more specific since I'm not writing all of the standard methods in the controllers

  resources :canvases do
    resources :layers do 
      resources :circles
      resources :rectangles
      resources :paths
      resources :spyros
    end
  end

  # resources :artists

  get "/dashboard" => "artists#show"

  # route for live streaming the canvas to multiple users
  get "/canvases/:canvas_id/layers/:id/stream" => "layers#stream"

  # for omniauth callbacks
  get 'auth/:provider/callback' => "artists#login"

end
