HarvestHelper::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  get "users/show"

  devise_for :users, :controllers => {
                        :sessions => 'my_devise/sessions'
                    }

  root to: 'static_pages#home'
  
  resources :users, only: [:show]
	#resources :sessions, only: [:new, :create, :destroy]
  resources :garden_devices
  resources :device_schedules, only: [:create, :destroy]
  resources :message_boards, only: [:index, :show]
  resources :posts, only: [:show, :new, :create, :destroy]
  resources :comments, only: [:new, :create, :destroy]
  
  match '/about', to: 'static_pages#about'
  match '/add_device', to: 'garden_devices#new'
  
  match '/data_receiver', to: 'garden_device_service#receive_data', via: :post
  match '/polling_service', to: 'garden_device_service#poll_for_updates', via: :post
  
  match '/charts/:action', to: 'charts#overview', as: :charts
  match "/garden_devices/:id/graphs" => "garden_devices#graphs", :as => 'graphs'
end
