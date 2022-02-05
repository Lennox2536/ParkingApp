Rails.application.routes.draw do
  root 'home#index'
  get '/auth/slack/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#log_out'

  resources :places, only: %i[index show update]
end