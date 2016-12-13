class RemoveUserColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :address_1
  	remove_column :users, :address_2
  	remove_column :users, :city
  	remove_column :users, :state
  	remove_column :users, :country
  	remove_column :users, :h_lat
  	remove_column :users, :h_long

  end
end

