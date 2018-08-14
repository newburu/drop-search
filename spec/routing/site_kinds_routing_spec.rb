require "rails_helper"

RSpec.describe SiteKindsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/site_kinds").to route_to("site_kinds#index")
    end

    it "routes to #new" do
      expect(:get => "/site_kinds/new").to route_to("site_kinds#new")
    end

    it "routes to #show" do
      expect(:get => "/site_kinds/1").to route_to("site_kinds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/site_kinds/1/edit").to route_to("site_kinds#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/site_kinds").to route_to("site_kinds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/site_kinds/1").to route_to("site_kinds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/site_kinds/1").to route_to("site_kinds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/site_kinds/1").to route_to("site_kinds#destroy", :id => "1")
    end
  end
end
