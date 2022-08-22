class Surfboard < ApplicationRecord
  belongs_to :user
  validates :description, :price, :rating, presence: true
end
