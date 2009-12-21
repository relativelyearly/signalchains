# == Schema Information
#
# Table name: effects_processors
#
#  id                 :integer         not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  effects_type       :string(255)
#  interface          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer         default(0)
#  chain_gears_count  :integer         default(0)
#

require 'test_helper'
 
class EffectsProcessorTest < ActiveSupport::TestCase
  context "A EffectsProcessor instance" do
    setup do
      @effects_processor = Factory(:effects_processor)
    end

    subject { @effects_processor }

    should_have_attached_file :image
  end
end
