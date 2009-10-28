require 'test_helper'
 
class ChainTest < ActiveSupport::TestCase
  context "A Chain instance" do
    setup do
      @chain = Factory(:chain)
    end

    subject { @chain }

    should_have_attached_file :audio
  end
end