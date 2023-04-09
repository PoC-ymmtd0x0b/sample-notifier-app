class Page < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  has_one_attached :ogp_image
end
