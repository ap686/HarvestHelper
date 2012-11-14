HarvestHelper::Application.routes.draw do
  root to: 'static_pages#home'
  
  resources :users, only: [:show, :new, :create]
	resources :sessions, only: [:new, :create, :destroy]
  
  match '/about', to: 'static_pages#about'
  match '/signup', to: 'users#new'
	match '/signin', to: 'sessions#new'
	match '/signout', to: 'sessions#destroy', via: :delete
end
