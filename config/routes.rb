Rails.application.routes.draw do
  resources :bats
  resources :notes
  resources :researchers

  root 'static#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sesssions#create'

  delete '/logout', to: 'sessions#delete'
end
