class AddTitleToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :name, :string, null: false
  end
end
