class AddAdminToUsers < ActiveRecord::Migration[6.0]
  #this is going to be to the users table(:users)
  # the column name will be admin (:admin)
  # and the column type will be a boolean (:boolean)
  #the default value of this column will be false.
  # to confirm a column i will type in (rails db:migrate) to the terminal.
  # user.toggle!(:admin) is the command for making a user admin.
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
