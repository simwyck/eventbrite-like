Rails.application.routes.draw do

  get 'creations/new'

  root 'static_pages#home'

  resources :users
  resources :events

  get 'static_pages/home'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'

  #get 'sessions/new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/reset', to: 'users#reinitialize'

end
