Rails.application.routes.draw do
  root 'items#index'
  get '/home/contact', to: 'home#contact', as: 'contacts'
  get '/home/about_us', to: 'home#about_us', as: 'about_us'
  devise_for :users
  resources :reviews
  resources :items
  resources :carts
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
