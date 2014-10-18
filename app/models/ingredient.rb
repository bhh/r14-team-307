class Ingredient < ActiveRecord::Base
  has_many :assignments
  has_many :recipes, through: :assignments
end
