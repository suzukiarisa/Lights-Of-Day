class CreateFindFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :find_friends do |t|

      t.integer :user_id
      t.string :image
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
