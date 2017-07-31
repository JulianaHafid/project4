Rails.application.routes.draw do

  #match 'services/book/:service_id/:helper_id' => 'services#book', :via => :put
  get 'services/book/:service_id/:helper_id' => 'services#book'
  get 'dashboard/index'
  get 'dashboard/match'
  get 'dashboard/seekers'
  get 'dashboard/helpers'
  get 'static/index'

  # app/config/routes.rb
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :services
  resources :profiles
  #devise_for :users


  root 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
