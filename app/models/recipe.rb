class Recipe < ActiveRecord::Base
  searchkick

  has_many :assignments
  has_many :ingredients, through: :assignments

  def search_data
    {
      ingredient_data: ingredient_ids
    }
  end

  def update_ingredient_count
    update(ingredient_count: ingredients.count)
  end
end
