class Category < ApplicationRecord
#rails generate migration create_categories, this will be the code i write to create a database for categories. same code will be written for users or articles etc.
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
  #forming the associations for article categories and 
  #articles through the article categories
  has_many :article_categories
  #from this i can do @category.articles to display the articles
  has_many :articles, through: :article_categories
end