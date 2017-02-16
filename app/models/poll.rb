class Poll < ActiveRecord::Base

	belongs_to :user
  	has_many :restaurants, dependent: :destroy
  	has_many :restaurant_polls, dependent: :destroy
end
