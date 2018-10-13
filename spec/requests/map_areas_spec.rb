require 'rails_helper'

RSpec.describe "MapAreas", type: :request do
  describe "GET /map_areas" do
    it "works! (now write some real specs)" do
      get map_areas_path
      expect(response).to have_http_status(200)
    end
  end
end
