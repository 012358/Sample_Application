require "rails_helper"

RSpec.describe BookMarksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/book_marks").to route_to("book_marks#index")
    end

    it "routes to #new" do
      expect(:get => "/book_marks/new").to route_to("book_marks#new")
    end

    it "routes to #show" do
      expect(:get => "/book_marks/1").to route_to("book_marks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/book_marks/1/edit").to route_to("book_marks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/book_marks").to route_to("book_marks#create")
    end

    it "routes to #update" do
      expect(:put => "/book_marks/1").to route_to("book_marks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/book_marks/1").to route_to("book_marks#destroy", :id => "1")
    end

  end
end
