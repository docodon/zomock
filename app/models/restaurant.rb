class Restaurant < ActiveRecord::Base

	belongs_to :poll
	has_many :restaurant_users, dependent: :destroy

end
