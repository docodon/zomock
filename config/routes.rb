Rails.application.routes.draw do
  namespace :api do
  	namespace :v0 do
  		post '/' => 'sessions#install'
  		post '/launch' => 'sessions#launch'
  	end
  end
end
