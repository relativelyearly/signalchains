require 'test_helper'

class ChainTest < ActiveSupport::TestCase
  context "A Chain instance" do
    setup do
      @chain = Factory(:chain)
    end

    subject { @chain }

    should_belong_to :user
    should_have_one :audio, :dependent => :destroy
  end
end