require "rails_helper"

RSpec.describe AssortmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/assortments").to route_to("assortments#index")
    end

    it "routes to #new" do
      expect(get: "/assortments/new").to route_to("assortments#new")
    end

    it "routes to #show" do
      expect(get: "/assortments/1").to route_to("assortments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/assortments/1/edit").to route_to("assortments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/assortments").to route_to("assortments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/assortments/1").to route_to("assortments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/assortments/1").to route_to("assortments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/assortments/1").to route_to("assortments#destroy", id: "1")
    end
  end
end
