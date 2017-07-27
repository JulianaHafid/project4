Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/match'

  
  get 'static/index'

  # app/config/routes.rb
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  resources :services
  resources :profiles
  #devise_for :users

  root 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
# Rails.application.routes.draw do
#       devise_for :users, controllers: {
#         sessions: 'users/sessions'
#       }
#     end
