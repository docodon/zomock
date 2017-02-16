class RestaurantPoll < ActiveRecord::Base
	
	belongs_to :restaurant
	belongs_to :poll

	validates_uniqueness_of :flock_user, scope: :poll

end
