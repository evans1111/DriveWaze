module HomeHelper

  def get_address(street_address)
    geocode = "https://maps.googleapis.com/maps/api/geocode/json?address=#{street_address}&key=AIzaSyAGY3TSCSVmFPdYz_0HiLShcTLOfo3lKrY"
    street_address.gsub(' ', '+')
    response_geocode = HTTParty.get(geocode)
    response.body
  end

  def current_location
    url = "https://www.google.com/maps/@25.7988077,-80.2042434,15z"
    response = HTTParty.get(url)
    p response.body
  end
end
