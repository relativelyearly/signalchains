# == Schema Information
#
# Table name: likes
#
#  id         :integer(4)      not null, primary key
#  chain_id   :integer(4)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'
 
class LikeTest < ActiveSupport::TestCase
  context "A Like instance" do
    setup do
      @like = Factory(:like)
    end

    subject { @like }

    should_validate_uniqueness_of :chain_id, :scoped_to => [:user_id]
  end
end
