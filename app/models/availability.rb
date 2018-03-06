class Availability < ApplicationRecord
  belongs_to :spot
  has_many :bookings

  def time_range
    return "#{self.to.hour - 12} - #{self.from.hour - 12}"
  end




end
