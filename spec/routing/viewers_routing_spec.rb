require "rails_helper"

RSpec.describe ViewersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/viewers").to route_to("viewers#index")
    end

    it "routes to #new" do
      expect(get: "/viewers/new").to route_to("viewers#new")
    end

    it "routes to #show" do
      expect(get: "/viewers/1").to route_to("viewers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/viewers/1/edit").to route_to("viewers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/viewers").to route_to("viewers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/viewers/1").to route_to("viewers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/viewers/1").to route_to("viewers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/viewers/1").to route_to("viewers#destroy", id: "1")
    end
  end
end
