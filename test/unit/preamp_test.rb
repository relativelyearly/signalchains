require 'test_helper'
 
class PreampTest < ActiveSupport::TestCase
  context "A Preamp instance" do
    setup do
      @preamp = Factory(:preamp)
    end

    subject { @preamp }

    should_have_attached_file :image
  end
end