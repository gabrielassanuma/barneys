class Booking < ApplicationRecord
  belongs_to :surfboard
  belongs_to :user

  validates :starts_at, presence: true
  validates :ends_at, presence: true, comparison: { greater_than_or_equal_to: :ends_at }
end
