class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :eventname, null: false
      t.text :address, null: false
      t.string :siteurl, null: false
      t.text :comment, null: false
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
