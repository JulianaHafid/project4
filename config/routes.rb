Rails.application.routes.draw do
  resources :reviews
  resources :services
  resources :profiles
  devise_for :users
  root 'reviews#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
