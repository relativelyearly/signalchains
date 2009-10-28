require 'test_helper'
 
class ApplicationControllerTest < ActionController::TestCase
  should_filter_params :password, :confirm_password, :password_confirmation
  
  context "#logged_in?" do
    should "return true if there is a user session" do
      @user = Factory(:user)
      UserSession.create(@user)
      assert controller.logged_in?
    end
    
    should "return false if there is no session" do
      assert !controller.logged_in?
    end
  end
end