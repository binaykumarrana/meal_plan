class FavoriteMealsController <ApplicationController
before_action :require_login
	def index
		@favorite = current_user.favorites
	end

end
