class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def change
    #to confirm this table i will write rails db:migrate
    create_table :article_categories do |t|
      t.integer :article_id
      t.integer :category_id
    end
  end
end
