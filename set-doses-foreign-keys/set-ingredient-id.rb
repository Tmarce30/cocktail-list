require 'csv'

def ingredients_list
  ingredients = []
  CSV.foreach('input-csv/ingredients-names.csv') do |row|
    ingredients << row
  end
  ingredients.flatten
end


def set_ingredient_id_in_dose
  ingredients = ingredients_list

  csv_options = { write_headers: true, headers: ["amount", "cocktail_id", "ingredient_id"] }

  CSV.open('output-csv/doses-with-foreign-keys.csv', "w", csv_options) do |csv|
    ingredients.each_with_index do |ingredient, i|
      CSV.foreach('input-csv/doses.csv') do |row|
        if ingredient == row[2]
          ingredient_id = i + 1
        else
          next
        end

        csv << [row[1], row[0], ingredient_id]
      end
    end
  end
end

set_ingredient_id_in_dose
