class AddAgeToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :department, :string
    add_column :profiles, :age, :integer
    add_column :profiles, :joined_year, :date
  end
end
