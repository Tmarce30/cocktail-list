require 'csv'

def to_boolean(string)
  string.downcase.to_s == 'true'
end

puts 'Cleaning database'
Cocktail.destroy_all

count = 0

puts 'Creating cocktails'
CSV.foreach('db/csv/seed-cocktails.csv', headers: true) do |row|
  puts count += 1
  cocktail = Cocktail.create!(
    name:              row['Name'],
    description:       row['Description'],
    recipe:            row['Recipe'],
    remote_photo_url:   row['photo_url'],
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
count = 0
CSV.foreach('db/csv/seed-doses.csv', headers: true) do |row|
  count += 1
  puts count
  Dose.create!(
    description:    row['description'],
    cocktail_id:    row['cocktail_id'].to_i,
    ingredient_id:  row['ingredient_id'].to_i
    )
end

puts 'Finished'










