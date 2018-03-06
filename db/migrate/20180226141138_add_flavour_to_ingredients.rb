class AddFlavourToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :flavour, :string
  end
end
