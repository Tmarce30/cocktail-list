class CreateCocktails < ActiveRecord::Migration[5.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :description
      t.text :recipe

      t.timestamps
    end
  end
end
