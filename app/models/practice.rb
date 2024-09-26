class Practice < ApplicationRecord
  has_many :practices_books, dependent: :destroy
  has_many :books, through: :practices_books
  accepts_nested_attributes_for :practices_books
end
