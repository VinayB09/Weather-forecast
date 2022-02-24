require 'rails_helper'
describe WeatherConcern do
  include WeatherConcern

  describe 'construct query' do 
    it 'constructs weather query' do 
      address = 'London, UK'
      api_key = rand(10 ** 10)
      result = construct_current_weather_query(address, api_key)
      expect(result).to eq("q=#{address}&appid=#{api_key}&units=imperial")
    end

    it 'constructs daily forecast query' do 
      lat = 80.001
      lon = 12.110
      api_key = rand(10 ** 10)
      result = construct_forecast_api_query(lat, lon, api_key)
      expect(result).to eq("lat=#{lat}&lon=#{lon}&appid=#{api_key}&exclude=minutely,hourly&units=imperial")
    end
  end
end