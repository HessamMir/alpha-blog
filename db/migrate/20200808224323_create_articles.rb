class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    # creating a table in articles and changing it to t
    create_table :articles do |t|
      t.string :title
      t.text :description
    end
  end
end
