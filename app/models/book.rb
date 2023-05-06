class Book < ApplicationRecord
  has_one_attached :cover
  has_many :practices_books
end
