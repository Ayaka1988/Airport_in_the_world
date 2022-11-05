class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :airport_name, null: false
      t.integer :genre_id, null: false
      t.integer :user_id, null: false
      t.string :open_hour
      t.text :sleep_space
      t.string :access
      t.string :security
      t.string :wifi
      t.string :url
      t.text :others


      t.timestamps
    end
  end
end
