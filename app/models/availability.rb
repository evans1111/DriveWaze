class Availability < ApplicationRecord
  belongs_to :spots #singular?
  has_many :bookings
end
