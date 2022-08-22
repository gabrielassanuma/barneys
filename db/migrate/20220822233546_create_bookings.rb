class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :surfboard, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :total_price
      t.boolean :acceptance
      t.text :comment

      t.timestamps
    end
  end
end
