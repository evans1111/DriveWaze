class DashboardController < ApplicationController
  require 'google_maps_service'

  def index
    @dashboard = current_user
    @spots = current_user.spots
    @availabilities = Availability.all


    GoogleMapsService.configure do |config|
      config.key = ENV["MAPS"]
      config.retry_timeout = 20
      config.queries_per_second = 10
      gmaps = GoogleMapsService::Client.new

      # query = [Spot.find(1).street, Spot.find(1).city, "FL"].join(', ')
      #Grabs first 2 spots. Eventually grab all spots and translating
      spots = current_user.spots

      #map over all spots
      gon.latlng = spots.map do |spot|
        #creates query for gmaps
        query = [spot.street, spot.city, "FL"].join(', ')
        #translates to latitude/long
        results = gmaps.geocode(query)
        #parse data

        # Requires real addresses for host locations
        # results[0][:geometry][:location].values
        end
      end

  end


  private


end
