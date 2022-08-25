class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :review
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :surfboard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
