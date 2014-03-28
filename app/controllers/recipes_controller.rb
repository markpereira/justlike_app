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
      @recipes = Recipe.where('name ilike ?', "%#{ params[:search]}%")
    end 
  end

  #search yummly database for recipes and makes a copy for local search function
  
  def search_yummly
    search = params[:search]
    search = URI.escape(search)
        app_key = "43d68684682bf636cfc259b4c36c275c"
        app_id = "94c36fdb"
        url = "http://api.yummly.com/v1/api/recipes?_app_id=#{app_id}&_app_key=#{app_key}&q=#{search}&maxResult=10&start=10"
        @search_result = HTTParty.get(url)
        
        if ["Error"] == "Recipe not found!"
          @status = "no results"
        else
        @status = "found results" 
        @search_result["matches"].each do |result|
          recipe = Recipe.new
          recipe.yummly_id = result["id"]
          recipe.name = result["recipeName"]
          recipe.image = result["smallImageUrls"].first
          recipe.rating = result["rating"]
          recipe.servingsize = result["numberOfServings"]
          recipe.cooktime = result["totalTimeInSeconds"]
          recipe.save
          result["ingredients"].each do |ingredient_result|
            ingredient = Ingredient.new  
            ingredient.name = ingredient_result
            ingredient.save
            recipe.ingredients << ingredient 
           end 
        end
      end
      recipes = Recipe.where('name ilike ?', "%#{ params[:search]}%")
      @recipes = recipes.reverse
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
