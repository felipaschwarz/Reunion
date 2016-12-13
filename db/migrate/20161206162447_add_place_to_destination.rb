class AddPlaceToDestination < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :place, :string
    add_column :destinations, :place_position, :string
  end
end
