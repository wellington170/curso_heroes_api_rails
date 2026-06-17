class AddAttributesToHeroes < ActiveRecord::Migration[8.1]
  def change
    add_column :heroes, :power, :string
    add_column :heroes, :age, :integer
    add_column :heroes, :city, :string
  end
end
