require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #edit" do
      get("/users/edit").should route_to("users#edit")
    end

  end
end
