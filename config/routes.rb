Spyrolous::Application.routes.draw do

resources :canvases do
  resources :layers do 
    resources :circles
    resources :rectangles
    resources :paths
  end
end

resources :artists

get "/dashboard" => "artists#show"

# route for live streaming the canvas to multiple users
get "/canvases/:canvas_id/layers/:id/stream" => "layers#stream"

end
