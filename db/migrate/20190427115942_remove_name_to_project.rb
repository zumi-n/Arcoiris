class RemoveNameToProject < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :name, :string, null: false
  end
end
