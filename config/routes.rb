HarvestHelper::Application.routes.draw do
  devise_for :users

  root to: 'static_pages#home'
  
  #resources :users, only: [:show, :new, :create]
	#resources :sessions, only: [:new, :create, :destroy]
  resources :garden_devices, only: [:show, :new, :create, :index]
  resources :device_schedules, only: [:create, :destroy]
  resources :message_boards, only: [:index, :show]
  resources :posts, only: [:show, :new, :create, :destroy]
  resources :comments, only: [:new, :create, :destroy]
  
  match '/about', to: 'static_pages#about'
  #match '/signup', to: 'users#new'
	#match '/signin', to: 'sessions#new'
	#match '/signout', to: 'sessions#destroy', via: :delete
  match '/add_device', to: 'garden_devices#new'
  
  match '/data_receiver', to: 'garden_device_service#receive_data', via: :post
  match '/polling_service', to: 'garden_device_service#poll_for_updates', via: :post
end
