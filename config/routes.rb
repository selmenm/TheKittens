Rails.application.routes.draw do
  resources :breeds
  root 'items#index'
  get '/home/contact', to: 'home#contact', as: 'contacts'
  devise_for :users,
  	:controllers => {:registrations => "registrations"}
    # path: '',
    # path_names: { sign_up: 'Create Account', sign_in: 'Login', sign_out: 'Logout', password: 'Reset Password'}
  devise_scope :user do 
  	get "/my_profile" => "registrations#show" 
  end
  resources :reviews
  resources :items
  resources :carts
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end