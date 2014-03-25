class CuisinesController < ApplicationController
  def index
    @cuisines = Cuisine.all
  end

  def create
    cuisine = Cuisine.create params[:cuisine]
    redirect_to cuisine
  end

  def new
    @cuisine = Cuisine.new
  end

  def edit
    @cuisine = Cuisine.find params[:id]
  end

  def show
    @cuisine = Cuisine.find params[:id]
  end

  def update
    cuisine = Cuisine.find params[:id]
    cuisine.update_attributes params[:cuisine]
    redirect_to cuisine
  end

  def destroy
    cuisine = Cuisine.find params[:id]
    cuisine.destroy
    redirect_to cuisines_path
  end
end
