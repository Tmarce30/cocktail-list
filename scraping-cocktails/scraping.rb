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
  # "https://www.socialandcocktail.co.uk/cocktails/mojito"

  html_file = open('mojit-cocktail.htm').read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.recipe-content').each do |element|
    p element.search('p')[1].text.strip
  end
end

