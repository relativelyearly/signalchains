require 'test_helper'
 
class EqualizerTest < ActiveSupport::TestCase
  context "A Equalizer instance" do
    setup do
      @equalizer = Factory(:equalizer)
    end

    subject { @equalizer }

    should_have_attached_file :image
  end
end