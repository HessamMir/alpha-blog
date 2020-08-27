class Article < ApplicationRecord
   # this is a many to one which is the articles belonging to a user
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum:100 }
  validates :description, presence: true, length: { minimum:10, maximum:300 }
end
