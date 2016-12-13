class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
    	t.references :user, index: true, foreign_key: true
    	t.references :friend, index: true
    	t.string :status

      t.timestamps
    end
    
    add_index :friendships, [:user_id, :friend_id], unique: true
   
  end
end
