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

class Ad < ActiveRecord::Base
  attr_accessible :image, :url

  has_attached_file(:image,
    :styles => {:display => '130x100#'},
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml")
end
