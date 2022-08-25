class AddColumnsToSurfboards < ActiveRecord::Migration[7.0]
  def change
    add_column :surfboards, :model, :string
    add_column :surfboards, :dimensions, :string
    add_column :surfboards, :tail_config, :string
    add_column :surfboards, :experience_level, :integer
  end
end
