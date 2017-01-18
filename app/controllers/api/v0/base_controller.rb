module Api
  module V0
    class BaseController < ActionController::Base
    	
    	before_action :set_current_user   	
      	attr_reader :current_user

    	def set_current_user
 			begin
 				user = TokenDecrypter.decode_params(request.headers["event-token"])			
 				@current_user = User.find_by_flock_id(user["userId"])
 			rescue Exception => e
 			   	render json: {status: false}, status: 422
 			end	
    	end

    end
  end
end
