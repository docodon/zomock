class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      
      t.belongs_to :user, index: true,null: false
      
      t.string :entity_type, null: false
      t.integer :entity_id, null: false
      t.text :title, null: false
      t.decimal :latitude, null: false,precision: 10, scale: 6
      t.decimal :longitude, null: false,precision: 10, scale: 6
      t.integer :city_id,null: false
      t.text :city_name,null: false
      t.integer :country_id,null: false
	    t.text :country_name,null: false

      t.timestamps null: false
    end
       
    add_foreign_key :locations, :users

  end
end
