Rails.application.routes.draw do

  root 'static#home'

  get '/signup', to: 'researchers#new'
  post '/signup', to: 'researchers#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#delete'

  resources :bats do
    resources :notes, only: [:create]
  end

  resources :researchers
end
