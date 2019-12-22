class CreateFestivals < ActiveRecord::Migration[5.2]
  def change
    create_table :festivals do |t|

    	t.integer :festival_name_id
	    t.integer :place_id
	    t.string :image_id
	    t.string :event_date
	    t.integer :prefecture_id
	    t.text :body
	    t.datetime :deleted_at
	    t.datetime :created_at, null: false
	    t.datetime :updated_at, null: false

        t.timestamps
    end
  end
end
