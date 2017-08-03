Rails.application.routes.draw do

  #match 'dashboard/review/:id' => 'dashboard#review', :via => :put
  get 'services/book/:service_id/:helper_id' => 'services#book'
  #match 'dashboard/review/:id' => 'dashboard#review', :via => :put
  get 'services/review/:id' => 'services#review' , :as => "services_review"


  get 'dashboard/index'
  get 'dashboard/match'
  get 'dashboard/seekers'
  get 'dashboard/helpers'
  # namespace :dashboard do
  #   resources :seekers
 get 'dashboard/sendmail' => 'dashboard#sendmail'
  #
  # end
  get 'static/index'

  # app/config/routes.rb
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :services
  resources :profiles
  #devise_for :users


  root 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
