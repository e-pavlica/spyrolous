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

end
