Rails.application.routes.draw do
  
# omniauth facebook
  devise_for :users, :controllers => { 
  	:omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "registrations"
  	#:confirmations => "confirmations"
  } 

  get '/main/home' => 'main#welcome'
  get '/main/privacy' => 'main#privacy', :as => :privacy
  get '/users/welcome' => 'user#welcome'
  get '/locations/:id/delete' => 'locations#delete', :as => :delete_location
  get '/projects/:id/delete' => 'projects#delete', :as => :delete_project
  get '/ads/:id/delete' => 'ads#delete', :as => :delete_ad
  get '/tasks/:id/delete' => 'tasks#delete', :as => :delete_task
  get '/location_image/:id/delete' => 'location_images#delete', :as => :delete_location_images
  #post '/developers/index' => 'developers#index_update'
  get '/developers/index' => 'developers#index_update'
  get '/hosts/index' => 'hosts#index_update'
  get 'testing/welcome' => 'testing#welcome'

  resources :developers, :hosts, :projects, :locations, :ads, :tasks, :location_images
  resources :conversations do
    resources :messages
  end

  match 'user_root' => 'user#welcome', as: :user_root, :via => :get


  root :to => 'main#welcome'
end