require "rails_helper"

RSpec.describe MobItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/mob_items").to route_to("mob_items#index")
    end

    it "routes to #new" do
      expect(:get => "/mob_items/new").to route_to("mob_items#new")
    end

    it "routes to #show" do
      expect(:get => "/mob_items/1").to route_to("mob_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mob_items/1/edit").to route_to("mob_items#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/mob_items").to route_to("mob_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mob_items/1").to route_to("mob_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mob_items/1").to route_to("mob_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mob_items/1").to route_to("mob_items#destroy", :id => "1")
    end
  end
end
