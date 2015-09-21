require "rails_helper"

RSpec.describe EmplyeesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/emplyees").to route_to("emplyees#index")
    end

    it "routes to #new" do
      expect(:get => "/emplyees/new").to route_to("emplyees#new")
    end

    it "routes to #show" do
      expect(:get => "/emplyees/1").to route_to("emplyees#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/emplyees/1/edit").to route_to("emplyees#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/emplyees").to route_to("emplyees#create")
    end

    it "routes to #update" do
      expect(:put => "/emplyees/1").to route_to("emplyees#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/emplyees/1").to route_to("emplyees#destroy", :id => "1")
    end

  end
end
