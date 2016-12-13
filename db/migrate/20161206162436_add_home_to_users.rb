class AddHomeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :home, :string
    add_column :users, :lat, :float
    add_column :users, :lng, :float
  end
end
