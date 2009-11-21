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