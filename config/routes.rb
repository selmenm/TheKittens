Rails.application.routes.draw do

  get 'errors/not_found'
  get 'errors/internal_server_error'
  root 'items#index' 
  get '/home/contact', to: 'home#contact', as: 'contacts'
  get '/home/about_us', to: 'home#about_us', as: 'about_us'
  get '/home/faq', to: 'home#faq', as: 'faq'
  get '/add_to_carts/:id' => 'carts#additem', as: 'addtocart'
  get '/remove_from_carts/:id' => 'carts#removeitem', as: 'removefromcart'



  devise_for :users,
    :controllers => {:registrations => "registrations"},
    path: '',
    path_names: { sign_up: 'Create Account', sign_in: 'Login', sign_out: 'Logout', password: 'Reset Password'}
  devise_scope :user do 
    get "/my_profile" => "registrations#show"
    get "/my_profile/security" => "registrations#security"
  end

  resources :reviews
  resources :items

    get '/carts/payment' => 'carts#payment'
  resources :carts
  resources :orders
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end



