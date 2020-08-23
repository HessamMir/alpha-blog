Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  # this gives all the routes we want for articles, we can take the only's off if we want to use all of the routes
  resources :articles, only: [:show, :index, :new, :create, :edit, :update,:destroy]
  resources :users
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

end
