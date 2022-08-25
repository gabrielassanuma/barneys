class RemoveColumnFromSurfboards < ActiveRecord::Migration[7.0]
  def change
    remove_column :surfboards, :title, :string
  end
end
