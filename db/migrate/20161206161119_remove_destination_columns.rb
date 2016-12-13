class RemoveDestinationColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :destinations, :address_1
  	remove_column :destinations, :address_2
  	remove_column :destinations, :city
  	remove_column :destinations, :state
  	remove_column :destinations, :country
  	remove_column :destinations, :h_lat
  	remove_column :destinations, :h_long
  end
end
