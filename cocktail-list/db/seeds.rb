require 'csv'

def to_boolean(string)
  string.downcase.to_s == 'true'
end

puts 'Cleaning database'
Cocktail.destroy_all

puts 'Creating cocktails'
CSV.foreach('db/csv/seed-cocktails.csv') do |row|
  Cocktail.create!(
    name:        row[0],
    description: row[1],
    recipe:      row[2]
    )
end

puts 'Creating Ingredients'
CSV.foreach('db/csv/seed-ingredients.csv', headers: true) do |row|
  Ingredient.create!(
    name:    row['Name'],
    flavour: row['Flavour'],
    topping: to_boolean(row['Topping']),
    mixer:   to_boolean(row['Mixer']),
    alcool:  to_boolean(row['Alcool'])
    )
end

puts 'Creating Doses'
CSV.foreach('db/csv/seed-doses.csv', headers: true) do |row|
  Dose.create!(
    description:    row['description'],
    cocktail_id:    row['cocktail_id'],
    ingredient_id:  row['ingredient_id']
    )
end

puts 'Finished'


