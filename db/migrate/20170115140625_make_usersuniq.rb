class MakeUsersuniq < ActiveRecord::Migration
  def change
	add_index :users, :flock_id, :unique => true  
  end
end
