require 'test_helper'
 
class ChainGearTest < ActiveSupport::TestCase
  context "A ChainGear instance" do
    setup do
      @chain_gear = Factory(:chain_gear)
    end

    subject { @chain_gear }

  end
end