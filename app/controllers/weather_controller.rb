class WeatherController < ApplicationController
  include WeatherConcern

  ## Empty route, renders root path
  def index; end

  ## Route to handle Ajax form submit.
  #  Method willl take the form params
  #  invokes Api Service and
  #  renders javascript to dynamically 
  #  update the `index` view
  def search
    @error = false
    @weather = {}
    @cached = true
    @address = params[:address]
    zip_code = params[:zip_code]
    current_weather_response, @cached = Api::OpenWeatherApiServices.new.current_weather_api(@address, zip_code)
    raise 'Current Weather API call: Failed' unless current_weather_response['coord'].present?
    coordinates = current_weather_response['coord']
    @current_weather = current_weather_response
    daily_weather_response, @cached = Api::OpenWeatherApiServices.new.forecast_api(coordinates, zip_code)
    raise 'Daily weather API call: Failed' unless daily_weather_response['daily'].present?
    @daily_weather = daily_weather_response['daily'].take(4)
    # Rails.cache.clear
    respond_to do |format|
      format.js 
    end
  rescue StandardError => e
    Rails.logger.error e
    Rails.logger.error e.backtrace
  end
end
