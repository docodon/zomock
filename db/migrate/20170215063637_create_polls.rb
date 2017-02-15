class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
		t.references :user, index: true, foreign_key: true      
		t.timestamps null: false
    end
  end
end
