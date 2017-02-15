class ChangetableRestaurantUser < ActiveRecord::Migration
  def change
	change_column :restaurant_users, :user_id, :integer, null: false  	
 	change_column :restaurant_users, :restaurant_id, :integer, null: false
  end
end
