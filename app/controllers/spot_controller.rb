class SpotController < ApplicationController
  before_action :set_spot, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]


  def index
    # shows current user spots -- @spots = current_user.spots
    
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

  def new
    @spot = current_user.spots.build
  end

  def create
    @spot = current_user.spots.build(spot_params)
    if @spot.save
      redirect_to listing_spot_path(@spot), notice: "Saved..."
    else
      render :new, notice: "Something went wrong..."
    end
  end

  def listing
  end

  def show
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

  def update
    if @spot.update(spot_params)
      flash[:notice] = "Saved..."
    else
      flash[:notice] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:zip, :city, :street, :description, :price, :image,)
  end
end
