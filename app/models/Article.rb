class Article < ApplicationRecord
   # this is a many to one which is the articles belonging to a user
  belongs_to :user
  #has many article categories
  has_many :article_categories
  #has many categories through the article categories database.
  #from this i can do @article.categories to display the categories
  # i can add categories to articles by using the shovel method <<. e.g "@article.categories << @category"
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: { minimum: 6, maximum:100 }
  validates :description, presence: true, length: { minimum:10, maximum:300 }
end
