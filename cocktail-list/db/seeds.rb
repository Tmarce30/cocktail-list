require 'csv'

puts 'Cleaning database'
Cocktail.destroy_all

puts 'Creating cocktails'
CSV.foreach('db/csv/cocktails-seed.csv') do |row|
  Cocktail.create!(
    name:        row[0].encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => ''),
    description: row[1].encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => ''),
    recipe:      row[2].encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => '')
    )
end

puts 'Finished'
