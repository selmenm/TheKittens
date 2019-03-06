Rails.application.routes.draw do

  root 'items#index' 
  get '/home/contact', to: 'home#contact', as: 'contacts'
  get '/home/about_us', to: 'home#about_us', as: 'about_us'
  get '/home/faq', to: 'home#faq', as: 'faq'
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
end