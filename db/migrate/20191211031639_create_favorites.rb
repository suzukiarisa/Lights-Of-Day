class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

	    t.integer :festival_id, null: false, foreign_key: true
        t.integer :user_id, null: false, foreign_key: true
        t.datetime :deleted_at

	    t.timestamps
    end
  end
end
