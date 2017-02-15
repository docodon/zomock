class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.references :poll, index: true, foreign_key: true   
      t.text :thumb, null: false
      t.text :url, null: false
      t.timestamps null: false
    end
  end
end
