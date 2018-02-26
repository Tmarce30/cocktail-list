class PagesController < ApplicationController\

  def home
    @cocktails = Cocktail.order("RANDOM()").first(12)
  end
end
