require 'test_helper'

class NewArticleTest < ActionDispatch::IntegrationTest
    setup do
      @admin_user = User.create(username: "hassanmir", email: "hassanmir@hotmail.com", 
      password: "password", admin: true)
      sign_in_as(@admin_user)
  end

  test "get new article form and create article" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: " hessamd", description: "hessam testing",
       category_ids: [4,5] } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match article_path ,response.body
    
  end

end
