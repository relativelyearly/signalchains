# == Schema Information
#
# Table name: mics
#
#  id                 :integer(4)      not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  mic_type           :string(255)
#  diaphragm_size     :string(255)
#  pattern            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer(4)      default(0)
#  chain_gears_count  :integer(4)      default(0)
#  featured_at        :datetime
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
