class DashboardController < ApplicationController
  def index
    @dashboard = current_user
    @spots = Spot.all
  end
end
