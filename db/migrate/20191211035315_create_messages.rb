class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

    	t.integer :user_id
	    t.string :send_date
	    t.string :send_time
        t.string :content


        t.timestamps
    end
  end
end
