class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  #i have put require in the before actions so that those who dont have account wont be able to edit any page through the url
  #i have put the require same user method there also so that only users who are logged into the account will be able to edit the same account 

  def show  
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    
  end
 #here i have added the pagination again
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @user = User.new
  end

  def create
     #new user = user.new (with a username password and email)
    @user = User.new(user_params)
    if @user.save
      #this is the code for logging in
      session[:user_id] = @user.id
      #the hashtage is what will be displayed as a print function in this case its the users username.
      flash[:notice] = "welcome #{@user.username}, you have succesfully signed up!"
      redirect_to articles_path
    else
      render 'new'
  end
end

def edit

end

def update 
   # here i have said that if the user updates the user then there will be a flash, user params has been refactored
  if @user.update(user_params)
    flash[:notice] = "User was updated successfully."
    redirect_to user_path(@user)
  else
    render 'edit'

  end
end

def destroy
  @user.destroy
  session[:user_id] = nil
  flash[:notice] = "Account and all articles successfully deleted"
  redirect_to articles_path
end

  private 
   #here i have made sure that i refactored the user params and used it in the other methods for less writing
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  
  def set_user
    @user = User.find(params[:id])

  end
  #this is a restriction which only allows users who are logged in to have access to delete or update the account
  def require_same_user
    if current_user != @user
      flash[:alert] = "you dont have access to do anything with #{@user.username}'s account"
      redirect_to user_path(@user)
      
    end
    
  end

end
