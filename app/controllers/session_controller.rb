class SessionController < ApplicationController
  def new    
  end

  #create user logon session

  def create
    user = User.where(:name => params[:name]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      session[:user_id] = nil
      flash[:notice] = "Incorrect email address or password. Please try again."
      redirect_to login_path
    end
  end

  # end user logon session

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end