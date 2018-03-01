class DashboardController < ApplicationController
  def index
    @dashboard = current_user
  end
end
