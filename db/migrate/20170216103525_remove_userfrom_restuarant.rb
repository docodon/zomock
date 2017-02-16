class RemoveUserfromRestuarant < ActiveRecord::Migration
  def change
  	remove_column :restaurant_users, :user_id
  	add_column :restaurant_users, :flock_user, :text, null: false, index: true
  end
end
