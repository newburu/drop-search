require 'rails_helper'

RSpec.describe "SiteKinds", type: :request do
  describe "GET /site_kinds" do
    it "works! (now write some real specs)" do
      get site_kinds_path
      expect(response).to have_http_status(200)
    end
  end
end
