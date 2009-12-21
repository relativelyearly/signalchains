require 'test_helper'

class AdTest < ActiveSupport::TestCase
  context "A Ad instance" do
    setup do
      @ad = Factory(:ad)
    end

    subject { @ad }

    should_have_attached_file :image
  end
end