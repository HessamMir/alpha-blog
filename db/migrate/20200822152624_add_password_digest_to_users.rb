class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
     #here we have said that the users table will have a password as a form of a String
    add_column :users, :password_digest, :string
  end
end
