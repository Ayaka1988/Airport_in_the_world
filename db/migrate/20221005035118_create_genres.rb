class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :ancestry
      t.index ["ancestry"], name: "index_categories_on_ancestry"
      t.timestamps
    end
    add_index :genres, :ancestry
  end
end
