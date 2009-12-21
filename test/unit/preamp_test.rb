# == Schema Information
#
# Table name: preamps
#
#  id                 :integer(4)      not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  circuitry          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer(4)      default(0)
#  chain_gears_count  :integer(4)      default(0)
#  featured_at        :datetime
#

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
