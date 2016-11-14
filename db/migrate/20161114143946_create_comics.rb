class CreateComics < ActiveRecord::Migration[5.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :editor
      t.string :artist
      t.string :year
      t.integer :price
      t.string :photo
      t.string :genre
      t.string :description
      t.string :tags
      t.string :state
      t.boolean :availability
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
