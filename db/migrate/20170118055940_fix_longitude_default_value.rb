class FixLongitudeDefaultValue < ActiveRecord::Migration
  def change
  	change_column :locations, :longitude, :decimal, :precision => 10, :scale => 6, :default => 77.210276
  end
end
