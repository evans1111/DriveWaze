class Availability < ApplicationRecord
  belongs_to :spots #plural
  has_many :bookings
end
