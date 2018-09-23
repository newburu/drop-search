require 'rails_helper'

RSpec.describe "MobItems", type: :request do
  describe "GET /mob_items" do
    it "works! (now write some real specs)" do
      get mob_items_path
      expect(response).to have_http_status(200)
    end
  end
end
