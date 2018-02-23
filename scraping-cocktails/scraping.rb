require 'nokogiri'
require 'csv'


html_file = open('cocktail-html-source.htm').read
html_doc = Nokogiri::HTML(html_file)

csv_options = { write_headers: true, headers: ["name","ingredients"] }

CSV.open("cocktails.csv", 'w', csv_options) do |csv|
  html_doc.search('.recipe_summary.pjax').each do |element|
    name = element.search('h3').text
    ingredients = element.search('.content-appear').search('p').first.text

    csv << [name, ingredients]
  end
end
