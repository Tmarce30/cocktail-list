require 'nokogiri'
require 'csv'

def scrap_cocktail_index
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
end

def scrap_cocktail_pages

  csv_options = { write_headers: true, headers: ["name","recipe"] }

  CSV.open('recipes.csv', 'w', csv_options) do |csv|
    CSV.foreach('cocktails.csv') do |row|
      url = "https://www.socialandcocktail.co.uk/cocktails/#{row[0]}"

      html_file = open('mojit-cocktail.htm').read
      html_doc = Nokogiri::HTML(html_file)

      name = row[0]
      recipe = html_doc.search('.recipe-content').search('p')[1].text.strip

      csv << [name, recipe]
    end
  end
end

scrap_cocktail_pages
