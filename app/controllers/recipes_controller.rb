	class RecipesController < ApplicationController

		before_action :require_login

		def index
			@recipes = current_user.recipes.order(:id)
		end

		def show
			@recipe = current_user.recipes.find(params[:id])

		end
		def new
			@recipe = current_user.recipes.build	
		end
		def create
			@recipe = current_user.recipes.build(recipe_params)
			if @recipe.save
				redirect_to recipe_path(@recipe), notice: "Recipe Created!"
			else
				@errors = @recipe.errors.full_messages
				render :new
			end
		end

		def edit
			@recipe = current_user.recipes.find(params[:id])
		end

		def update
    		@recipe = current_user.recipes.find(params[:id])

    		if @recipe.update_attributes(recipe_params)
      			redirect_to recipe_path(@recipe), notice: "Recipe Updated!"
    		else
      			@errors = @recipe.errors.full_messages
      			render :edit
    		end
		end

		def destroy
			recipe = current_user.recipes.find(params[:id])
			recipe.destroy
			redirect_to recipes_path, notice: "Deleted Recipe: #{recipe.name}"
		end
		# Add and remove favorite recipes
  		# for current_user
  		def favorite
  			byebug
    	type = params[:type]
    	@recipe = current_user.recipes.find(params[:id])
    	if type == "favorite"
    		if FavoriteRecipe.where(:recipe_id => @recipe.id).present?
				redirect_to recipe_path(@recipe), notice: "Already favorited #{@recipe.name}"
    		else
    			current_user.favorites << @recipe
      			redirect_to recipe_path(@recipe), notice: "You favorited #{@recipe.name}"
    		end
      		#redirect_to :back, notice: 'You favorited #{@recipe.name}'

    	elsif type == "unfavorite"
      		current_user.favorites.delete(@recipe)
      		redirect_to recipe_path(@recipe), notice: "You Unfavorited #{@recipe.name}"
      		#redirect_to :back, notice: 'Unfavorited #{@recipe.name}'

    	else
      	# Type missing, nothing happens
      		redirect_to recipe_path(@recipe), notice: "Issue with favorite!"
    	end
  		end
		private
		def recipe_params
			byebug
 			params.require(:recipe).permit(:name, :description)
		end

	end