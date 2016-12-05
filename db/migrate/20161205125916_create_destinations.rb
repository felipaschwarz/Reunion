class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :arrival_on
      t.string :departure_on
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.string :h_lat
      t.string :h_long
      t.string :user_id

      t.timestamps
    end
  end
end
