# == Schema Information
#
# Table name: audios
#
#  id                :integer         not null, primary key
#  status            :string(255)     default("converting")
#  created_at        :datetime
#  updated_at        :datetime
#  audible_id        :integer
#  audible_type      :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#

require 'test_helper'

class AudioTest < ActiveSupport::TestCase
  context "An Audio instance" do
    setup do
      @audio = Factory(:audio)
    end

    subject { @audio }

    should_have_attached_file :high_quality
    should_have_attached_file :mp3
    should_have_attached_file :ogg

    should_belong_to :audible
  end
end
