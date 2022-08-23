class Surfboard < ApplicationRecord
  belongs_to :user
  validates :description, :price, :rating, presence: true
  has_many_attached :photos
end
