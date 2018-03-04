class Availability < ApplicationRecord
  belongs_to :spot
  has_many :bookings

  def time_range
    return "#{self.start_time} - #{self.end_time}"
  end
end
