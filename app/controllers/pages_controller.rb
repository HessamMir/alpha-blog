class PagesController < ApplicationController
  def home
     #this means, besides going to the home page the user will be going to the articles path if they have been logged in
  redirect_to articles_path if logged_in?
  end
  
  def about
  end
end
