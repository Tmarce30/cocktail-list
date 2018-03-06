class AddMixerToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :mixer, :boolean
  end
end
