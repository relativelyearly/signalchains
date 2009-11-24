require 'test_helper'

class MicTest < ActiveSupport::TestCase
  context "A Mic instance" do
    setup do
      @mic = Factory(:mic)
    end

    subject { @mic }

    should_have_attached_file :image
    should_have_many :chains, :through => :chain_gears
    should_have_many :comments, :dependent => :destroy
  end
end