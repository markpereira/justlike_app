class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def create
    recipe = Recipe.create params[:recipe]
    redirect_to recipe
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find params[:id]
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  def update
    recipe = Recipe.find params[:id]
    recipe.update_attributes params[:recipe]
    redirect_to recipe
  end

  def destroy
    recipe = Recipe.find params[:id]
    recipe.destroy
    redirect_to recipes_path
  end 

  #search local database for recipes

  def search
    @status = "no search"
    search = params[:search]
    if search.present?
      @recipes = Recipe.where('name ilike ?', "%#{search}%")
    end 
  end

  #search yummly database for recipes and makes a copy for local search function
  
  def search_yummly
    @recipes = Recipe.yummly(params[:search])
  end 

  #adding recipes to your dashboard favourites tab

  def add_to_my_recipes
    recipe = Recipe.find params[:id]
    @current_user.recipes << recipe
    redirect_to(:back)
  end  

  #remove recipes to your dashboard favourites tab

  def delete_from_my_recipes
    recipe = Recipe.find params[:id]
    @current_user.recipes.delete( params[:id] )
    redirect_to(:back)
  end  

  #runs a local search for a random selection of recipes

  def trending
    @recipes = Recipe.order("RANDOM()").limit(5)
  end
end
