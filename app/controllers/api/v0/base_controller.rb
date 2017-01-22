module Api
  module V0
    class BaseController < ActionController::Base
    	require 'cgi'


    	before_action :set_current_user   	
      	attr_reader :current_user

    	def set_current_user
 			begin
 				auth_header = request.headers["event-token"]
 				auth_header = parse_auth_header  if auth_header.nil?
 				user = TokenDecrypter.decode_params(auth_header)			
 				@current_user = User.find_by_flock_id(user["userId"])
 			rescue Exception => e
 			   	render json: {status: false}, status: 422
 			end	
    	end

    	private

    	def parse_auth_header
    		begin
    			refering_url = request.headers["referer"]
    			url_params   = refering_url.split('?')[1]
    			CGI::parse(url_params)["flockEventToken"][0] 
    		rescue
    			return nil
    		end
    	end

    end
  end
end
