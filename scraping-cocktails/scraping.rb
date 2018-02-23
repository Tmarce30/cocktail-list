require 'open-uri'
require 'nokogiri'

def scrap_cocktails
  url = "https://www.socialandcocktail.co.uk/top-100-cocktails/"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.recipe_summary.pjax').each do |element|
    puts element.search('h3').text
    ingredients = element.search('.content-appear').search('p').text.split('br')

    # puts element.text.strip
    # puts element.attribute('href').value
  end
end

# def scrap_ingredients(ingredients)
#   ingredients
# end
