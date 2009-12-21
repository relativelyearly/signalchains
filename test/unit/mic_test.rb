# == Schema Information
#
# Table name: mics
#
#  id                 :integer         not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  mic_type           :string(255)
#  diaphragm_size     :string(255)
#  pattern            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer         default(0)
#  chain_gears_count  :integer         default(0)
#

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
