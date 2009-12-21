# == Schema Information
#
# Table name: equalizers
#
#  id                 :integer         not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  equalizer_type     :string(255)
#  bands              :integer
#  interface          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer         default(0)
#  chain_gears_count  :integer         default(0)
#

require 'test_helper'
 
class EqualizerTest < ActiveSupport::TestCase
  context "A Equalizer instance" do
    setup do
      @equalizer = Factory(:equalizer)
    end

    subject { @equalizer }

    should_have_attached_file :image
  end
end
