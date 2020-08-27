class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
     #the articles table will contain an extra column of user_id which is passed over as an int
    add_column :articles, :user_id, :int
     #this user id will work with our many (users) to one (articles) function

  end
end
