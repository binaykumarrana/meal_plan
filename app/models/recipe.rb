	class Recipe < ApplicationRecord
	  belongs_to :user
	   # Favorited by users
  	  has_many :favorite_recipes # just the 'relationships'
  	  has_many :favorited_by, through: :favorite_recipes, source: :user # the actual users favoriting a recipe


	  validates :name, presence: true, uniqueness: { scope: :user_id }
	  validates :description, presence: true
	  validates :user, presence: true

	  def to_s
	    name
	  end
	end
