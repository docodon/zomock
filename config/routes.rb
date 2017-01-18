Rails.application.routes.draw do
  namespace :api do
  	namespace :v0 do
  	
  		post '/' => 'sessions#install'
  		post '/launch' => 'sessions#launch'
  		put '/update_location' => 'locations#update'
  	    #resources :locations, only: [:update]
	
  	end
  end
end
