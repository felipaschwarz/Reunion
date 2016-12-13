class AddLatLngToDestinations < ActiveRecord::Migration[5.0]
  def change
  	add_column :destinations, :lat, :float
  	add_column :destinations, :lng, :float
  end
end
