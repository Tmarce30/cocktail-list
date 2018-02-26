require 'csv'

def ingredients_list
  # Open csv to return an array with all the ingredients names
  # array = [[id, name]]
  ingredients = []
  CSV.foreach('input-csv/ingredients-names.csv') do |name|
    ingredients << name
  end
  return ingredients.flatten
end


def set_ingredient_id_in_dose
  ingredients = ingredient_list
  # Iterate on ingredient list with index
    # Iterate on dose csv rows
    # Set id as index + 1 if ingredient[1] == row ingredient in dose else breake
    # Save to csv [amount, cocktail_id, ingredient_id]
    # delete row
end

p ingredients_list[19]
