class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|

    	t.integer :recommend_id
	    t.integer :memory_id
	    t.integer :find_friend_id
	    t.datetime :created_at, null: false
        t.datetime :updated_at, null: false

        t.timestamps
    end
  end
end
