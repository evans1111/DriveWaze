class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :availability

  def time_left
    current_time = Time.now
    finish_time = self.availability.from
    time_left = finish_time - current_time

    seconds = (time_left % 60)
    minutes = (time_left / 60) % 60
    hours = (time_left / (60 * 60))

    return format("%02d:%02d:%02d", hours, minutes, seconds)
  end

  def time_now
    return time_now = Time.now.strftime("%I:%M %p")
  end

end
