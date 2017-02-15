Rails.application.routes.draw do
  namespace :api do
  	namespace :v0 do
  	
  		post '/' => 'sessions#install'
  		post '/launch' => 'sessions#launch'
  		put  '/update_location' => 'locations#update'
      post '/menu_images' => 'locations#menu_images'
      post '/share' => 'sharing#share_restaurants'	

      resources :polls, only: [:create , :show, :update] do
      end



  	end
  end
end
