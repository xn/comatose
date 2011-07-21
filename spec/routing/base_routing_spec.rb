require 'spec_helper'

describe Comatose::BaseController do

  describe "a route" do
    it "routes to comatose#show" do
      get("/en").should route_to :controller => "comatose/base", :action => "show"
    end
  end


end
