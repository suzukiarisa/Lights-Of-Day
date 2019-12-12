class CreateRecommends < ActiveRecord::Migration[5.2]
  def change
    create_table :recommends do |t|

    	t.integer :user_id
	    t.string :post_date
	    t.string :spot
	    t.string :image
	    t.text :body
	    t.datetime :created_at, null: false
        t.datetime :updated_at, null: false

        t.timestamps
    end
  end
end
