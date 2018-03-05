class SpotsController < ApplicationController
  before_action :set_spot, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]


  def index
    # shows current user spots -- @spots = current_user.spots
    spots = Spot.all
    GoogleMapsService.configure do |config|
      config.key = ENV["MAPS"]
      config.retry_timeout = 20
      config.queries_per_second = 10
      gmaps = GoogleMapsService::Client.new

      # query = [Spot.find(1).street, Spot.find(1).city, "FL"].join(', ')
      #Grabs first 2 spots. Eventually grab all spots and translating
      spots = Spot.first(5)

      #map over all spots
      gon.latlng = spots.map do |spot|
        #creates query for gmaps
        query = [spot.street, spot.city, "FL"].join(', ')
        #translates to latitude/long
        results = gmaps.geocode(query)
        #parse data
        results[0][:geometry][:location].values
      end
    end


    #Search function for feed - search by zip code
    if not params[:zip].nil?
      @spots = Spot.where('zip LIKE ?', params[:zip]).page(params[:spot])
      # Spot.where('zip LIKE ?', "%#{params[:zip]}%")
    else
      @spots = Spot.all.page(params[:spot])
    end
  end

  #AJAX ?
  @spot = Spot.new


  def new
    # @spot = current_user.spots.build
    @spot = Spot.new
  end

  def create
     @spot = current_user.spots.build(spot_params)
     respond_to do |format|
       if @spot.save
         format.html { redirect_to dashboard_index_path }
         format.json { render :show, status: :created, location: @spot }
       else
         format.html { render :new }
         format.json { render json: @spot.errors, status: :unprocessable_entity }
       end
     end

    # Non Ajax Code
    # if @spot.save
    #   # redirect_to listing_spot_path(@spot), notice: "Saved..."
    #   redirect_to dashboard_index_path , notice: "Your parking spot was created!"
    #   return
    #   # else
    #   #   render :new, notice: "Something went wrong..."
    # end
  end

  def listing
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def location
  end

  def search
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to dashboard_index_path
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])

      if @spot.update_attributes(spot_params)
        redirect_to dashboard_index_path, notice: 'Spot was successfully updated.'
      else
        render :edit
      end

  end

  private

  def new_spot
    @spot = current_user.spots.build(spot_params)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:zip, :city, :street, :description, :price, :image, :availability)
  end
end
