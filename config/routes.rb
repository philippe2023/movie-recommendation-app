Rails.application.routes.draw do
  get 'movies/show'
  # Define routes for pages without the 'pages/' prefix
  root 'pages#home'
  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'
  # config/routes.rb
  resources :movies, only: [:show]
  # Reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check
end
