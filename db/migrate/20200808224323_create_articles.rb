class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    # creating a table articles subsitute to t
    create_table :articles do |t|
       #the table of articles will have a string title and a text of description
      t.string :title
      t.text :description
    end
  end
end
