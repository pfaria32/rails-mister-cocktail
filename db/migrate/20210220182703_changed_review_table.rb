class ChangedReviewTable < ActiveRecord::Migration[6.1]
  def change
    change_table :reviews do |t|
      t.remove :rating
      t.decimal :rating, precision: 2, scale: 1
    end
  end
end
