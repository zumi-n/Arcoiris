class AddAgeToProposition < ActiveRecord::Migration[5.2]
  def change
    add_column :propositions, :name, :string, null: false
    add_column :propositions, :description, :text
  end
end
