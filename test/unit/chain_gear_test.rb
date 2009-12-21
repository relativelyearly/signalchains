# == Schema Information
#
# Table name: chain_gears
#
#  id         :integer         not null, primary key
#  gear_id    :integer
#  gear_type  :string(255)
#  chain_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  notes      :text
#  position   :integer         default(2)
#

require 'test_helper'

class ChainGearTest < ActiveSupport::TestCase
  context "A ChainGear instance" do
    setup do
      @chain_gear = Factory(:chain_gear)
    end

    subject { @chain_gear }

    context "position" do
      context "on a mic" do
        setup do
          mic = Factory(:mic)
          @chain_gear = Factory(:chain_gear, :gear => mic)
        end

        should "have a position of 0" do
          assert_equal(0, @chain_gear.position)
        end
      end

      context "on a line in" do
        setup {@chain_gear = Factory(:chain_gear, :gear => nil)}

        should "have a position of 0" do
          assert_equal(0, @chain_gear.position)
        end
      end

      context "on a preamp" do
        setup do
          preamp = Factory(:preamp)
          @chain_gear = Factory(:chain_gear, :gear => preamp)
        end

        should "have a position of 1" do
          assert_equal(1, @chain_gear.position)
        end
      end

      [:dynamics_processor, :equalizer, :effects_processor].each do |gear_type|
        context "on a #{gear_type}" do
          setup do
            gear = Factory(gear_type)
            @chain_gear = Factory(:chain_gear, :gear => gear)
          end
          
          should "have a position of 2" do
            assert_equal(2, @chain_gear.position)
          end
        end
      end
    end
  end
end
