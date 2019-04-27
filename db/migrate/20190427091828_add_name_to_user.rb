class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, unique: true, index: true
  end
end
