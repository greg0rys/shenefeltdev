require "rails_helper"

RSpec.describe StripePurchasesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stripe_purchases").to route_to("stripe_purchases#index")
    end

    it "routes to #new" do
      expect(get: "/stripe_purchases/new").to route_to("stripe_purchases#new")
    end

    it "routes to #show" do
      expect(get: "/stripe_purchases/1").to route_to("stripe_purchases#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stripe_purchases/1/edit").to route_to("stripe_purchases#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stripe_purchases").to route_to("stripe_purchases#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stripe_purchases/1").to route_to("stripe_purchases#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stripe_purchases/1").to route_to("stripe_purchases#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stripe_purchases/1").to route_to("stripe_purchases#destroy", id: "1")
    end
  end
end
