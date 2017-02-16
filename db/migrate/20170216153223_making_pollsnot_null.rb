class MakingPollsnotNull < ActiveRecord::Migration
  def change
  	change_column :restaurant_polls, :poll_id, :integer, null: false 
  end
end
