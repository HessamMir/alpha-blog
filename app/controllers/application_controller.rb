class ApplicationController < ActionController::Base
  # here this helper method allows these methods to be used in the controller and views
  helper_method :current_user, :logged_in?
   #this method is for the current user who is logged in which has a speciic user id and it works if there 
  #is a session in place
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
     
 end
 #i can see if a current user is logged in through this
 def logged_in?
  !!current_user
 end

end
