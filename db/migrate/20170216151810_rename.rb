class Rename < ActiveRecord::Migration
  def change
  	rename_table :restaurant_users, :restaurant_polls
  	add_reference :restaurant_polls, :user, index: true
  end
end
