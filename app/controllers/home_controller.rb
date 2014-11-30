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
    @recipes = Recipe.search('*', where: { ingredient_data: params[:ingredient_ids] }, facets: [:ingredient_data])
    render json: @recipes
  end

  def possible_ingredients
    @recipes       = Recipe.search('*', where: { ingredient_data: params[:ingredient_ids], ingredient_count: possible_ingredient_count }, facets: [:ingredient_data])
    ingredient_ids = @recipes.facets['ingredient_data']['terms'].map { |x| x['term'] }
    @ingredients   = Ingredient.find ingredient_ids
    render json: @ingredients
  end

  private
  def possible_ingredient_count
    params[:ingredient_ids].count + 1
  end
end
