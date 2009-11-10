require 'test_helper'
 
class DynamicsProcessorTest < ActiveSupport::TestCase
  context "A DynamicsProcessor instance" do
    setup do
      @dynamics_processor = Factory(:dynamics_processor)
    end

    subject { @dynamics_processor }

    should_have_attached_file :image
  end
end