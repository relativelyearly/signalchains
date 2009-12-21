# == Schema Information
#
# Table name: likes
#
#  id         :integer         not null, primary key
#  chain_id   :integer
#  user_id    :integer
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
