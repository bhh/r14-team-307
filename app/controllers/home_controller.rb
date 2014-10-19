class HomeController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @recipes     = Recipe.all
  end

  def ingredient_list
    @ingredients = Ingredient.where ['name LIKE ?', "%#{params[:q]}%"]
    respond_to do |format|
      format.json do
        render json: @ingredients
      end
    end
  end

  def recipes

  end

  def possible_ingredients

  end
end
