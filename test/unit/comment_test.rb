require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  context "A Comment instance" do
    setup do
      @comment = Factory(:comment)
    end

    subject { @comment }

    should_belong_to :user
    should_belong_to :commentable
  end
end