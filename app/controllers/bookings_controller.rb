class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    @booking = current_user.bookings.build
    @booking.availability_id = params[:availability_id]
    if @booking.save!
      @booking.availability.avialable = false
      @booking.availability.save!
      redirect_to dashboard_index_path, notice: 'Parking Spot Booked!'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_index_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
