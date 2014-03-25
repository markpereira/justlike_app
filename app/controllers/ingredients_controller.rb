class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def create
    ingredient = Ingredient.create params[:ingredient]
    redirect_to ingredient
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find params[:id]
  end

  def show
    @ingredient = Ingredient.find params[:id]
  end

  def update
    ingredient = Ingredient.find params[:id]
    ingredient.update_attributes params[:ingredient]
    redirect_to ingredient
  end

  def destroy
    ingredient = Ingredient.find params[:id]
    ingredient.destroy
    redirect_to ingredients_path
  end
end
