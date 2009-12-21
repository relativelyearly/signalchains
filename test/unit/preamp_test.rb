# == Schema Information
#
# Table name: preamps
#
#  id                 :integer         not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  circuitry          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer         default(0)
#  chain_gears_count  :integer         default(0)
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
