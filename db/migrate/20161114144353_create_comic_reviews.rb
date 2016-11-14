class CreateComicReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :comic_reviews do |t|
      t.string :comment
      t.references :comic, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
