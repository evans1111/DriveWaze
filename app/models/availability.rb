class Availability < ApplicationRecord
  belongs_to :spot #singular?
  has_many :bookings
end
