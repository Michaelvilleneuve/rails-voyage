require "rails_helper"

RSpec.describe VoyagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/voyages").to route_to("voyages#index")
    end

    it "routes to #new" do
      expect(:get => "/voyages/new").to route_to("voyages#new")
    end

    it "routes to #show" do
      expect(:get => "/voyages/1").to route_to("voyages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/voyages/1/edit").to route_to("voyages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/voyages").to route_to("voyages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/voyages/1").to route_to("voyages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/voyages/1").to route_to("voyages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/voyages/1").to route_to("voyages#destroy", :id => "1")
    end

  end
end
