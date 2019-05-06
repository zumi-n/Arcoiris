class Project < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :title, :string, null: false
    add_reference :projects, :proposition, foreign_key: true, null:false
  end
end
