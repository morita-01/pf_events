class CreateEventComments < ActiveRecord::Migration[5.2]
  def change
    create_table :event_comments do |t|
      t.text :eventcomment
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
