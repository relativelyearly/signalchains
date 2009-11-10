require 'test_helper'
 
class EffectsProcessorTest < ActiveSupport::TestCase
  context "A EffectsProcessor instance" do
    setup do
      @effects_processor = Factory(:effects_processor)
    end

    subject { @effects_processor }

    should_have_attached_file :image
  end
end