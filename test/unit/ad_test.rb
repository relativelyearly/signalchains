# == Schema Information
#
# Table name: ads
#
#  id                 :integer(4)      not null, primary key
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  url                :string(255)
#

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
