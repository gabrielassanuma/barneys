class CreateSurfboards < ActiveRecord::Migration[7.0]
  def change
    create_table :surfboards do |t|
      t.text :description
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.float :rating

      t.timestamps
    end
  end
end
