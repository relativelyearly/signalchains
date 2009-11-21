require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context "using authlogic" do
    setup do
      activate_authlogic
    end

    should_be_authentic

    should_allow_mass_assignment_of :password, :password_confirmation, :email
    should_not_allow_mass_assignment_of :crypted_password, :password_salt, :persistence_token, :login_count, :last_request_at, :last_login_at,
      :current_login_at, :last_login_ip, :current_login_ip, :roles, :created_at, :updated_at, :id

    should_have_many :likes, :dependent => :destroy

    context "#deliver_password_reset_instructions!" do
      setup do
        @user = Factory(:user)
        Notifier.stubs(:deliver_password_reset_instructions)
      end

      should "reset the perishable token" do
        @user.expects(:reset_perishable_token!)
        @user.deliver_password_reset_instructions!
      end

      should "send the reset mail" do
        Notifier.expects(:deliver_password_reset_instructions).with(@user)
        @user.deliver_password_reset_instructions!
      end
    end
  end
  
  context "with likes" do
    setup do
      @user = Factory(:user)
      @chain = Factory(:chain)
      @other_chain = Factory(:chain)
      @like = Factory(:like, :user_id => @user.id, :chain_id => @chain.id)
    end
    
    should "confirm the like" do
      assert(@user.likes?(@chain))
    end
    
    should "confirm when not liked" do
      assert(!@user.likes?(@other_chain))
    end
  end
end
