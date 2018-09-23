require "rails_helper"

RSpec.describe MobsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/mobs").to route_to("mobs#index")
    end

    it "routes to #new" do
      expect(:get => "/mobs/new").to route_to("mobs#new")
    end

    it "routes to #show" do
      expect(:get => "/mobs/1").to route_to("mobs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mobs/1/edit").to route_to("mobs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/mobs").to route_to("mobs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mobs/1").to route_to("mobs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mobs/1").to route_to("mobs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mobs/1").to route_to("mobs#destroy", :id => "1")
    end
  end
end
