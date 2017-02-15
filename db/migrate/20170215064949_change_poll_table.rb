class ChangePollTable < ActiveRecord::Migration
  def change
  	change_column :polls, :user_id, :integer, null: false 
  end
end
