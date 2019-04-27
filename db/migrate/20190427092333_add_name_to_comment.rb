class AddNameToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :project, foreign_key: true
    add_column :comments, :content, :text
  end
end
