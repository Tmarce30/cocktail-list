class RemoveDescriptionFromCocktails < ActiveRecord::Migration[5.0]
  def change
    remove_column :cocktails, :description, :string
  end
end
