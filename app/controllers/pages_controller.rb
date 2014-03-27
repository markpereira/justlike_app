class PagesController < ApplicationController
  def home
  end

  def about
  end
  
  def blog
  end  

  def intro
  end

  def dashboard
  end	

  def error404
    render :status => 404
  end

end