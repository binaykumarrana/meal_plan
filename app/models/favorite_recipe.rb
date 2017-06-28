class FavoriteRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  has_many :favorites, :through => :favorite_recipes, :source => [:user, :recipe]
end
