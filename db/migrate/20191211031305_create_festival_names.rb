class CreateFestivalNames < ActiveRecord::Migration[5.2]
  def change
    create_table :festival_names do |t|

      t.string :name
	  t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
