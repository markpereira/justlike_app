class UsersController < ApplicationController
  protect_from_forgery :except => [:create]
  def index
    @users = User.all
  end

  def create
    user = User.create params[:user]
    session[:user_id] = user.id
    redirect_to intro_path
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def show
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update_attributes params[:user]
    redirect_to user
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to users_path
  end
end
