require 'nokogiri'
require 'csv'
require 'open-uri'

def scrap_cocktail_index
  html_file = open('cocktail-html-source.htm').read
  html_doc = Nokogiri::HTML(html_file)

  CSV.open("cocktails.csv", 'w') do |csv|
    html_doc.search('.recipe_summary.pjax').each do |element|
      csv << [element.search('h3').text]
    end
  end
end

def scrap_cocktail_pages
  count = 0

  CSV.open('recipes.csv', 'w') do |csv|
    CSV.foreach('cocktails.csv') do |row|
      count +=1
      p count
      url = "https://www.socialandcocktail.co.uk/cocktails/#{row[0].downcase.gsub(" ", "-")}/"

      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)

      name = row[0]
      description = html_doc.search('.recipe-content').search('p')[2].text.strip
      recipe = html_doc.search('.recipe-content').search('p')[1].text.strip
      ingredients = html_doc.search('.recipe-content').search('p')[0].text.strip

      csv << [name, description, recipe, ingredients]
    end
  end
end

scrap_cocktail_pages
