class Audio < ActiveRecord::Base
  attr_accessible :high_quality, :converted, :status

  belongs_to :audible, :polymorphic => true

  has_attached_file :high_quality,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:extension'

  has_attached_file :converted,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:extension'
end