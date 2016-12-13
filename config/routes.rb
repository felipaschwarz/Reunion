Rails.application.routes.draw do
  devise_for :users
  
  get 'profile', to: 'users#profile'
  root to: 'users#profile'
  post 'users/search_user', to: 'users#search_user'
	
  resources :users do
   	resources :friendships
   	resources :destinations
   	get 'map', to: 'destinations#showmap'
   end

end
