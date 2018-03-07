class Availability < ApplicationRecord
  belongs_to :spot
  has_many :bookings

  def time_left
    
  end

  def normal_time
    # Time.now.strftime("%I:%M %p")
    return "#{self.to.strftime("%I:%M %p")} - #{self.from.strftime("%I:%M %p")}"
  end






end
