class RestaurantPoll < ActiveRecord::Base
	
	belongs_to :restaurant
	belongs_to :poll
	
end
