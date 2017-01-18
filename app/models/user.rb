class User < ActiveRecord::Base

  	validates :flock_id, presence: true
  	validates :token, presence: true

  	has_one :location, dependent: :destroy 

  	after_create :add_location




  	private

  	def add_location
  		Location.create(user_id: id)
  	end

end
