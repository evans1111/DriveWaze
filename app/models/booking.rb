class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :availability



  def time_now
    return time_now = Time.now.strftime("%I:%M %p")
  end

end
