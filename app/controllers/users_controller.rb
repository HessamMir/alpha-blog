class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

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

  private 
   #here i have made sure that i refactored the user params and used it in the other methods for less writing
  def user_params
    params.require(:user).permit(:username, :email, :password)
     #this is the code neccessary for a user to exist.
  end
  
  
def set_user
  @user = User.find(params[:id])

end

end
