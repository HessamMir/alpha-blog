class SessionsController < ApplicationController

  def new
    
  end
 #this is a new session and its finding the email the user has put in that session which is downcased
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
     # here i have said that if the email in the session and password match, then the session user id will = to userid which basically means log in
    if @user && @user.authenticate(params[:session][:password])
       #this is short for logging in
      session[:user_id] = @user.id
      flash[:notice] = "logged in successfully"
       # after logging in the user will be taken to their profile
      redirect_to @user
    else
      flash.now[:alert] = "There was something wrong with your login details."
      render 'new'
    end
  end
 #this is the method made for loggin out
  def destroy
     #the session instead of being = to userid it will be nill which is nothing
    session[:user_id] = nil
    flash[:notice] = "logged out"
     #this will then take the user back to the home page
    redirect_to root_path
  end


end