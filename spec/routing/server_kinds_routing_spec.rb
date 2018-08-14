require "rails_helper"

RSpec.describe ServerKindsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/server_kinds").to route_to("server_kinds#index")
    end

    it "routes to #new" do
      expect(:get => "/server_kinds/new").to route_to("server_kinds#new")
    end

    it "routes to #show" do
      expect(:get => "/server_kinds/1").to route_to("server_kinds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/server_kinds/1/edit").to route_to("server_kinds#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/server_kinds").to route_to("server_kinds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/server_kinds/1").to route_to("server_kinds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/server_kinds/1").to route_to("server_kinds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/server_kinds/1").to route_to("server_kinds#destroy", :id => "1")
    end
  end
end
