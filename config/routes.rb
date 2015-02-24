Rails.application.routes.draw do

  root 'lightning_talks#index'
  resources :lightning_talks
  resources :registrations, only: [:new, :create]

  get '/sign-in' => 'authentication#new', as: :signin
  post '/sign-in' => 'authentication#create'
  get '/sign-out' => 'authentication#destroy', as: :signout

end
