class AddColumnstoRestaurant < ActiveRecord::Migration
  def change
  	add_column :restaurants, :name, :string, null: false
  	add_column :restaurants, :location, :string, null: false
  end
end
