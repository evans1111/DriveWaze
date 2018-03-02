class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.all
  end

  def new
    @availability = Availability.new
    @spot = Spot.find(params[:spot_id])
  end

  def create
    # @user = User.find_by(username: params[:username])
    @spot = Spot.find(params[:spot_id])
    @availability = Availability.new(availablility_params)
    @availability.spot_id = @spot

    respond_to do |format|
      if @availability.save
        format.html {redirect_to dashboard_index_path, notice: "Availability Created!"}
      else
        format.html {render :new}
      end
    end

  end
  private
  def availablility_params
    params.require(:availability).permit(:times, :spot_id)
  end
end
