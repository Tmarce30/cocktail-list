class AddAlcoolToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :alcool, :boolean
  end
end
