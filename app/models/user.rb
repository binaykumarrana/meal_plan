class User < ApplicationRecord
  include Clearance::User

  has_many :recipes
  has_many :meal_plans

  # Favorite recipes of user
  has_many :favorite_recipes # just the 'relationships'
  has_many :favorites, through: :favorite_recipes, source: :recipe # the actual recipes a user favorites


  def recipe_options
  	recipes.map do |recipe|  
  		[recipe.name, recipe.id]
  	end
  end
end
