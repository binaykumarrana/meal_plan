class FavoriteMealsController <ApplicationController
before_action :require_login
	def index
		@favorites = current_user.favorites
	end

end
