Rails.application.routes.draw do

  root 'lightning_talks#index'
  resources :lightning_talks, except:[:destroy]
  resources :registrations, only: [:new, :create]
  get '/auth/github/callback', to: 'authentication#create'
  get '/sign-in' => 'authentication#new', as: :signin
  post '/sign-in' => 'authentication#create'
  get '/sign-out' => 'authentication#destroy', as: :signout

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :lightning_talks
  end
end
