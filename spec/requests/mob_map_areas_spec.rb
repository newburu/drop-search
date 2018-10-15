require 'rails_helper'

RSpec.describe "MobMapAreas", type: :request do
  describe "GET /mob_map_areas" do
    it "works! (now write some real specs)" do
      get mob_map_areas_path
      expect(response).to have_http_status(200)
    end
  end
end
