Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admin/password',
  	registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
  	sessions:      'customers/sessions',
  	passwords:     'customers/passwords',
  	registrations: 'customers/registrations'
  }

  # admin
  namespace :admin do
    root 'top#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :products, except: [:destroy]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :order_details, only: [:update]
  end

  # customers
  root 'products#top'
  resources :customers, only: [:show, :edit, :update]
  get '/customers/unsubscribe' => 'customers#unsubscribe'
  patch '/customers/withdraw' => 'customers#withdraw'
  resources :shipping_addresses, except: [:new, :show]
  resources :cart_items, only: [:create, :index, :update, :destroy]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :orders, only: [:new, :create, :index, :show]
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/complete' => 'orders#complete'
  resources :products, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end