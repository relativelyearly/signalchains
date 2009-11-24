require 'test_helper'
 
class FollowTest < ActiveSupport::TestCase
  context "A Follow instance" do
    setup do
      @follow = Factory(:follow)
    end

    subject { @follow }

    should_belong_to :user
    should_belong_to :followed
  end
end