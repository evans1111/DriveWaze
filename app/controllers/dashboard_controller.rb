class DashboardController < ApplicationController
  require 'google_maps_service'

  def index
    @dashboard = current_user
    @spots = current_user.spots
    @bookings = current_user.bookings
    @availabilities = Availability.all
    @availability = Availability.new


    GoogleMapsService.configure do |config|
      config.key = 'AIzaSyCaOPw-q9E9srNzO8IEiAxiKPLIVnrX0nQ'
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

      @spot = Spot.new

  end

  def show
    @spot = Spot.find(params[:id])
    gon.current_street = @spot.street
    GoogleMapsService.configure do |config|
      config.key = 'AIzaSyCaOPw-q9E9srNzO8IEiAxiKPLIVnrX0nQ'
      config.retry_timeout = 20
      config.queries_per_second = 10
    gmaps = GoogleMapsService::Client.new
    @routes = gmaps.directions(
    '549 nw 28th st, Miami, FL, 33127, USA',
    '79 sw 12th st, Miami, FL, 33130, USA',
    mode: 'driving',
    alternatives: false)
    gon.start_address = @routes[0][:legs][0][:start_address]
    gon.end_address = @routes[0][:legs][0][:end_address]
    gon.center_lat = @routes[0][:legs][0][:start_location][:lat]
    gon.center_lng = @routes[0][:legs][0][:start_location][:lng]


  end

  end


  private


end
