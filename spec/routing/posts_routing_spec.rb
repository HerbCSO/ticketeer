require "rails_helper"

describe UsersController, :type => :routing do
  describe "routing" do

    it "routes to #edit" do
      expect(get("/users/edit")).to route_to("users#edit")
    end

  end
end
