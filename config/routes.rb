Spyrolous::Application.routes.draw do
  #set the root
  get "/" => "pages#index"

  resources :games
end
