class AddNameToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :phase, :string, null: false
    add_column :projects, :content, :text, null: false
  end
end
