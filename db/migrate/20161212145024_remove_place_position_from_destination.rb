class RemovePlacePositionFromDestination < ActiveRecord::Migration[5.0]
  def change
  	remove_column :destinations, :place_position
  end
end
