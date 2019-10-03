Rails.application.routes.draw do
  resources :statistics
  resources :challenges
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
