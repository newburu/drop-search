require "rails_helper"

RSpec.describe MapAreasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/map_areas").to route_to("map_areas#index")
    end

    it "routes to #new" do
      expect(:get => "/map_areas/new").to route_to("map_areas#new")
    end

    it "routes to #show" do
      expect(:get => "/map_areas/1").to route_to("map_areas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/map_areas/1/edit").to route_to("map_areas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/map_areas").to route_to("map_areas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/map_areas/1").to route_to("map_areas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/map_areas/1").to route_to("map_areas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/map_areas/1").to route_to("map_areas#destroy", :id => "1")
    end
  end
end
