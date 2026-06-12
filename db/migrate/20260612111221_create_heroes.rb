class CreateHeroes < ActiveRecord::Migration[8.1]
  def change
    #t é um TableBuilder, ou seja, um objeto qualquer t que representa a tabela sendo construída
    create_table :heroes do |t|
      t.string :name

      t.timestamps
    end
  end
end
