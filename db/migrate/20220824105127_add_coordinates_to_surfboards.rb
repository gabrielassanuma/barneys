class AddCoordinatesToSurfboards < ActiveRecord::Migration[7.0]
  def change
    add_column :surfboards, :title, :string
    add_column :surfboards, :address, :text
    add_column :surfboards, :latitude, :float
    add_column :surfboards, :longitude, :float
  end
end
