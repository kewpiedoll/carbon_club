require "spec_helper"

describe ProducersController do
  describe "routing" do

    it "routes to #index" do
      get("/producers").should route_to("producers#index")
    end

    it "routes to #new" do
      get("/producers/new").should route_to("producers#new")
    end

    it "routes to #show" do
      get("/producers/1").should route_to("producers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/producers/1/edit").should route_to("producers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/producers").should route_to("producers#create")
    end

    it "routes to #update" do
      put("/producers/1").should route_to("producers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/producers/1").should route_to("producers#destroy", :id => "1")
    end

  end
end
