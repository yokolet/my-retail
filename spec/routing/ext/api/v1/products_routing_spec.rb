require "rails_helper"

RSpec.describe Ext::Api::V1::ProductsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ext/apis").to route_to("ext/apis#index")
    end


    it "routes to #show" do
      expect(:get => "/ext/apis/1").to route_to("ext/apis#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ext/apis").to route_to("ext/apis#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ext/apis/1").to route_to("ext/apis#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ext/apis/1").to route_to("ext/apis#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ext/apis/1").to route_to("ext/apis#destroy", :id => "1")
    end

  end
end
