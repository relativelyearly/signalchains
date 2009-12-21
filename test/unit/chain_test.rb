# == Schema Information
#
# Table name: chains
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  status         :string(255)
#  name           :string(255)
#  notes          :text
#  title          :string(255)
#  performer      :string(255)
#  year           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  likes_count    :integer(4)      default(0)
#  comments_count :integer(4)      default(0)
#  featured_at    :datetime
#

require 'test_helper'

class ChainTest < ActiveSupport::TestCase
  context "A Chain instance" do
    setup do
      @chain = Factory(:chain)
    end

    subject { @chain }

    should_belong_to :user
    should_have_one :audio, :dependent => :destroy
    should_have_many :likes, :dependent => :destroy
    should_have_many :comments, :dependent => :destroy
  end
end
