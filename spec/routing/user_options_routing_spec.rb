require "rails_helper"

RSpec.describe UserOptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/user_options").to route_to("user_options#index")
    end

    it "routes to #new" do
      expect(:get => "/user_options/new").to route_to("user_options#new")
    end

    it "routes to #show" do
      expect(:get => "/user_options/1").to route_to("user_options#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_options/1/edit").to route_to("user_options#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/user_options").to route_to("user_options#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_options/1").to route_to("user_options#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_options/1").to route_to("user_options#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_options/1").to route_to("user_options#destroy", :id => "1")
    end
  end
end
