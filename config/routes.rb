Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	get '/' => 'users#index'
	get '/users' => 'users#create'
	get'/dashboard'=> 'auths#index'
	post '/sessions' => 'sessions#create'
	get '/logout' => 'sessions#destroy'
	resources :password_resets
end
