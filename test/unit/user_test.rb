# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  crypted_password    :string(255)
#  password_salt       :string(255)
#  email               :string(255)
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  login_count         :integer
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  display_name        :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  type                :string(255)
#  slug                :string(255)
#  login               :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

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
    should_have_many :follows, :dependent => :destroy
    should_have_many :followed_users

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
  
  context "with follows" do
    setup do
      @user = Factory(:user)
      @followed_user = Factory(:user)
      @unfollowed_user = Factory(:user)
      @follow = Factory(:follow, :user_id => @user.id, :followed_id => @followed_user.id)
    end

    should "confirm the follow" do
      assert(@user.follows?(@followed_user))
    end

    should "confirm when not followed" do
      assert(!@user.follows?(@unfollowed_user))
    end
  end
end
