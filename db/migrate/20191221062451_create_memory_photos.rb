class CreateMemoryPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :memory_photos do |t|

		t.string :image
		t.integer :memory_id
		t.datetime :deleted_at
	    t.datetime :created_at, null: false
	    t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
