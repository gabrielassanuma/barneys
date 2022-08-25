class RemoveOwnerColumnFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :owner, :boolean
  end
end
