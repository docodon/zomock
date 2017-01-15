class TokenAnDflockidNeverNull < ActiveRecord::Migration
  def change
  	change_column :users, :token, :text, null: false
  	change_column :users, :flock_id, :text, null: false
  end
end
