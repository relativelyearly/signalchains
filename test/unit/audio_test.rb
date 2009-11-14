require 'test_helper'

class AudioTest < ActiveSupport::TestCase
  context "An Audio instance" do
    setup do
      @audio = Factory(:audio)
    end

    subject { @audio }

    should_have_attached_file :high_quality
    should_have_attached_file :converted

    should_belong_to :audible
  end
end