class PagesController < ApplicationController\

  def home
    @cocktails = Cocktail.first(5)
  end
end
