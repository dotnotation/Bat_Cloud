Rails.application.routes.draw do

  root 'static#home'

  get '/signup', to: 'researchers#new'
  post '/signup', to: 'researchers#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#delete'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  get '/search', to: 'bats#search'

  get '/recently_discovered', to: 'bats#recently_discovered'

  resources :bats do
    resources :notes, only: [:new, :create, :show]
  end

  resources :researchers

  match '/*path', to: 'errors#not_found', via: [:get, :post]
end
