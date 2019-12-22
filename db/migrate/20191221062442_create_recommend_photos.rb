class CreateRecommendPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :recommend_photos do |t|

    	t.string :image
    	t.integer :recommend_id
    	t.datetime :deleted_at
	    t.datetime :created_at, null: false
	    t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
