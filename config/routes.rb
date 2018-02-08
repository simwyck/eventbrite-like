Rails.application.routes.draw do

  root 'static_pages#home'

  resources :users
  resources :events

  get 'static_pages/home'
  get 'static_pages/contact'
  get 'static_pages/about'

  #get 'sessions/new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
