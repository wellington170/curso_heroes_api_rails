class AddTokenToHeroes < ActiveRecord::Migration[8.1]
  def change
    add_column :heroes, :token, :string, null: false
    add_index :heroes, :token
  end
end
