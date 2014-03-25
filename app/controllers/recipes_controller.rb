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

  def search
    @status = "no search"
    search = params[:search]
    if search.present?
      search = URI.escape(search)
      app_key = "43d68684682bf636cfc259b4c36c275c"
      app_id = "94c36fdb"
      url = "http://api.yummly.com/v1/api/recipes?_app_id=#{app_id}&_app_key=#{app_key}&q=#{search}&maxResult=10&start=10"
      @search_result = HTTParty.get(url)
      #binding.pry 

      if ["Error"] == "Recipe not found!"
        @status = "no results"
      else
      @status = "found results" 
      #binding.pry
      end
    end 
  end 
end
