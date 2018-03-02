class BookingsController < ApplicationController

  def index
    @bookings = Bookings.all
  end

  def new
    @booking.in_use = true
    @booking.user_id = current_user.id
  end

end
