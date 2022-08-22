class Booking < ApplicationRecord
  belongs_to :surfboard
  belongs_to :user
end
