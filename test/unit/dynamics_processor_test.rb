# == Schema Information
#
# Table name: dynamics_processors
#
#  id                 :integer         not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  circuitry          :string(255)
#  compression_type   :string(255)
#  dynamics_type      :string(255)
#  interface          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer         default(0)
#  chain_gears_count  :integer         default(0)
#

require 'test_helper'
 
class DynamicsProcessorTest < ActiveSupport::TestCase
  context "A DynamicsProcessor instance" do
    setup do
      @dynamics_processor = Factory(:dynamics_processor)
    end

    subject { @dynamics_processor }

    should_have_attached_file :image
  end
end
