require "rails_helper"

RSpec.describe MobMapAreasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/mob_map_areas").to route_to("mob_map_areas#index")
    end

    it "routes to #new" do
      expect(:get => "/mob_map_areas/new").to route_to("mob_map_areas#new")
    end

    it "routes to #show" do
      expect(:get => "/mob_map_areas/1").to route_to("mob_map_areas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mob_map_areas/1/edit").to route_to("mob_map_areas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/mob_map_areas").to route_to("mob_map_areas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mob_map_areas/1").to route_to("mob_map_areas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mob_map_areas/1").to route_to("mob_map_areas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mob_map_areas/1").to route_to("mob_map_areas#destroy", :id => "1")
    end
  end
end
