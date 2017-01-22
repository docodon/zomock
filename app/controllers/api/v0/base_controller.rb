module Api
  module V0
    class BaseController < ActionController::Base
    	
    	before_action :set_current_user   	
      	attr_reader :current_user

    	def set_current_user
 			begin
 				p 'HEADERS from mobile !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
 				p request.headers
 				user = TokenDecrypter.decode_params(request.headers["event-token"])			
 				@current_user = User.find_by_flock_id(user["userId"])
 				p @current_user
 			rescue Exception => e
 				p 'ERROR MESSAGE FOR MOBILE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11111'
 				p e.message
 			   	render json: {status: false}, status: 422
 			end	
    	end

    end
  end
end
