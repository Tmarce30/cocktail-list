class AddDescriptionToCocktails < ActiveRecord::Migration[5.0]
  def change
    add_column :cocktails, :description, :text
  end
end
