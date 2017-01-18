class AddingDefaultLocations < ActiveRecord::Migration
  def change
  	
  	change_column :locations, :entity_type, :string, :default => "city"

  	change_column :locations, :entity_id, :integer, :default => 1

  	change_column :locations, :title, :text, :default => "Delhi NCR"

  	change_column :locations, :latitude, :decimal, :default => 28.625789

  	change_column :locations, :longitude, :decimal, :default => 210276

  	change_column :locations, :city_id, :integer, :default => 1

  	change_column :locations, :city_name, :text, :default => "Delhi NCR"

  	change_column :locations, :country_id, :integer, :default => 1

  	change_column :locations, :country_name, :text, :default => "India"

  end
end


# {"entity_type":"city","entity_id":1,"title":"Delhi NCR","latitude":28.625789,
# "longitude":77.210276,"city_id":1,"city_name":"Delhi NCR","country_id":1,
# "country_name":"India"}
