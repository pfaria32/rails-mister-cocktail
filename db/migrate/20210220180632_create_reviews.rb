class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.integer :likes
      t.references :cocktail, foreign_key: true

      t.timestamps
    end
  end
end
