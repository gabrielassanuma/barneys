class Surfboard < ApplicationRecord
  belongs_to :user
  validates :description, :price, :rating, presence: true
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :reviews
end
