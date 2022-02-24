require 'rails_helper'

RSpec.describe Api::OpenWeatherApiServices do
  #include Api::OpenWeatherApiServices

  describe 'OpenWeatherApiServices' do
    it 'returns current weather data based on address' do 
      address = 'London, UK'
      zip_code = "EC1A"
      result = Api::OpenWeatherApiServices.new.current_weather_api(address, zip_code)
      expect(result["coord"]).to eq({"lat"=>51.5085, "lon"=>-0.1257})
    end

    it 'returns daily weather data based on latitude and longitude' do 
      coords = {
        'lat' => '51.5085',
        'lon' => '-0.1257'
      }
      zip_code = "EC1A"
      result = Api::OpenWeatherApiServices.new.forecast_api(coords, zip_code)
      expect(result["timezone"]).to eq("Europe/London")
    end
  end
end