Rails.application.routes.draw do
  root 'home#index'
  get '/auth/slack/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#log_out'
  get '/book', to: 'places#book'
  get '/my_booking', to: 'bookings#my_booking'
  get '/release', to: 'bookings#release'
  get '/history', to: 'bookings#bookings_history'

  post 'slack/book', to: 'slack#book'
  post 'slack/release', to: 'slack#release'
  post 'slack/place_status', to: 'slack#place_status'

  resources :places, only: %i[index show]
end
