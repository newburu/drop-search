require "rails_helper"

RSpec.describe ItemKindsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/item_kinds").to route_to("item_kinds#index")
    end

    it "routes to #new" do
      expect(:get => "/item_kinds/new").to route_to("item_kinds#new")
    end

    it "routes to #show" do
      expect(:get => "/item_kinds/1").to route_to("item_kinds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/item_kinds/1/edit").to route_to("item_kinds#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/item_kinds").to route_to("item_kinds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/item_kinds/1").to route_to("item_kinds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/item_kinds/1").to route_to("item_kinds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_kinds/1").to route_to("item_kinds#destroy", :id => "1")
    end
  end
end
