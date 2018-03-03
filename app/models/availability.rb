class Availability < ApplicationRecord
  belongs_to :spot
  has_many :bookings
end
