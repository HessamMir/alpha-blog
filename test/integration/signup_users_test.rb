require 'test_helper'

class SignupUsersTest < ActionDispatch::IntegrationTest
 #create article
 #signup
 

  test "get new signup form and create user" do
    get "/signup" 
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path params: { user: { username: "hassanmir", email: "hassanmir@hotmail.com", 
      password: "password"} }
      
       
     end
     
end
end
