class BookingsController < ApplicationController

  def index
    @bookings = Bookings.all
  end

  def create
    @booking = Booking.new(booking_params)    
  end

end
