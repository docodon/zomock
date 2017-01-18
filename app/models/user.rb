class User < ActiveRecord::Base
  	validates :flock_id, presence: true
  	validates :token, presence: true

  	has_one :location, dependent: :destroy 

end
