require 'test_helper'

class ChainsControllerTest < ActionController::TestCase
  context "When not logged in" do
    should_require_user :new
  end
end