# == Schema Information
#
# Table name: comments
#
#  id               :integer(4)      not null, primary key
#  commentable_id   :integer(4)
#  commentable_type :string(255)
#  body             :text
#  user_id          :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#

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
