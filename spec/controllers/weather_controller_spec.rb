require 'rails_helper'

RSpec.describe WeatherController, type: :controller do 
  describe 'GET index' do 
    it 'returns index page' do 
      get :index
      expect(response).to render_template(:index) 
    end
  end

  describe 'GET search' do
    it 'renders a js' do
      expect {
        xhr :get, :search
      }.to expect(response.status).to eq (200)
    end
  end
end