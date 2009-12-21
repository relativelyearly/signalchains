# == Schema Information
#
# Table name: follows
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  followed_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

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
