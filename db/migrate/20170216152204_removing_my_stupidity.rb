class RemovingMyStupidity < ActiveRecord::Migration
  def change
  	remove_column :restaurant_polls, :user_id
  	add_reference :restaurant_polls, :poll, index: true
  end
end
