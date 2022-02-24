# frozen_string_literal: true

class Api::OpenWeatherApiServices
  include WeatherConcern
  def initialize
    @base_url = ENV['OPEN_WEATHER_API_URL']
    @api_key = Rails.application.credentials.dig(:openweather, :api_key)
  end

  ## Method will construct parameters to invoke 
  #  current weather api taking `address` and `api_key` 
  #  as inputs. Invokes API request by calling private method
  #  returns current weather with lat and lon value
  def current_weather_api(address, zip_code)
    query_params = construct_current_weather_query(address, @api_key)
    api_endpoint = "weather?#{query_params}"
    call_api(api_endpoint, zip_code, 'current')
  end

  ## Method will construct parameters to invoke 
  #  one call api to get forecast for next few days
  #  by taking `lat`, `lon` and `api_key` as inputs. 
  #  Invokes API request by calling private method
  #  returns weather forecase for upcoming days
  def forecast_api(coords, zip_code)
    query_params = construct_forecast_api_query(coords['lat'], coords['lon'], @api_key)
    api_endpoint = "onecall?#{query_params}"
    call_api(api_endpoint, zip_code)
  end

  private 

  ## Private method will invoke API call by taking 
  #  `api_endpoint url` as input
  #  returns API response in Ruby object format
  def call_api(api_endpoint, zip_code, type='forecast')
    cached = true
    response = Rails.cache.fetch("#{zip_code}_#{type}", expires_in: 30.minutes) do 
      cached = false
      HTTParty.get("#{@base_url}/#{api_endpoint}", query: {format: :json}).parsed_response
    end
    return response, cached
  end
end