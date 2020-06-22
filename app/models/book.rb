class Book < ApplicationRecord
 belongs_to :userS
  validates :title, presence: true
 validates :body, presence: true
end
