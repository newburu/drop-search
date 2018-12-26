require 'rails_helper'

RSpec.describe "UserOptions", type: :request do
  describe "GET /user_options" do
    it "works! (now write some real specs)" do
      get user_options_path
      expect(response).to have_http_status(200)
    end
  end
end
