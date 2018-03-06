class AddToppingToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :topping, :boolean
  end
end
