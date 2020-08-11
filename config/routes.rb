Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # this gives all the routes we want for articles
  resources :articles, only: [:show]
end
