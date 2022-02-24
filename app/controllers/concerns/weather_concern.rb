module WeatherConcern
  extend ActiveSupport::Concern

  included do
  end

  ## Method constructs query params for
  #  current weather API taking address and api_key
  #  returns query string
  def construct_current_weather_query(address, api_key)
    "q=#{address}&appid=#{api_key}&units=imperial"
  end

  ## Method constructs query params for
  #  current forecast API taking latitude, longitude and api_key
  #  returns query string
  def construct_forecast_api_query(lat, lon, api_key)
    "lat=#{lat}&lon=#{lon}&appid=#{api_key}&exclude=minutely,hourly&units=imperial"
  end
end