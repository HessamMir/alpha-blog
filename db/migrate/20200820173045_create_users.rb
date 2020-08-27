class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
       #user table will have a string of username and email along with the timestamps which are the created and and updated at
      t.string :username
      t.string :email 
      t.timestamps
    end
  end
end
