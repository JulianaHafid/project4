class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :review_text
      t.integer :reviewer_id
      t.integer :reviewee_id
      t.integer :rating

      t.timestamps
    end
  end
end
