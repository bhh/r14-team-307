class HomeController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @recipes     = Recipe.all
  end
end
