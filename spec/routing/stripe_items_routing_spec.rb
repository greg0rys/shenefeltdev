require "rails_helper"

RSpec.describe StripeItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stripe_items").to route_to("stripe_items#index")
    end

    it "routes to #new" do
      expect(get: "/stripe_items/new").to route_to("stripe_items#new")
    end

    it "routes to #show" do
      expect(get: "/stripe_items/1").to route_to("stripe_items#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stripe_items/1/edit").to route_to("stripe_items#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stripe_items").to route_to("stripe_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stripe_items/1").to route_to("stripe_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stripe_items/1").to route_to("stripe_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stripe_items/1").to route_to("stripe_items#destroy", id: "1")
    end
  end
end
