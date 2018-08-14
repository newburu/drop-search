require 'rails_helper'

RSpec.describe "ItemKinds", type: :request do
  describe "GET /item_kinds" do
    it "works! (now write some real specs)" do
      get item_kinds_path
      expect(response).to have_http_status(200)
    end
  end
end
