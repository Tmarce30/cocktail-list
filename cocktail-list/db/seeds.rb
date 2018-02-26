require 'csv'

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
  p row[2]
end

puts 'Finished'


def to_boolean(string)
  string.downcase.to_s == 'true'
end

