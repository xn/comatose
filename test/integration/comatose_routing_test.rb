require 'test_helper'
require 'action_dispatch/testing/assertions/routing'
require 'comatose/base_controller'
require 'comatose/base_helper'

# Re-raise errors caught by the controller.
class Comatose::BaseController
  def rescue_action(e) raise e end 
end

class ComatoseRoutingTest < Test::Unit::TestCase
  include ActionDispatch::Assertions::RoutingAssertions
  def test_route_works
    opts = { :controller => "comatose/base" }
    assert_routing "/en", opts
  end
end
