class Poll < ActiveRecord::Base

	belongs_to :user
  	has_many :restaurants, dependent: :destroy

end
