class Recipe < ActiveRecord::Base
  has_many :assignments
  has_many :ingredients, through: :assignments
end
