require 'net/http'

class Audio < ActiveRecord::Base
  attr_accessible :high_quality, :converted, :status, :converted_file_size,
                  :converted_file_name, :converted_content_type,
                  :converted_updated_at

  belongs_to :audible, :polymorphic => true

  before_save :update_status, :convert

  has_attached_file :high_quality,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:extension'

  has_attached_file :converted,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:extension'

  private
  def update_status
    if self.high_quality_updated_at_changed?
      self.status = 'converting'
    elsif self.converted_updated_at_changed?
      self.status = 'converted'
    end
  end

  def convert
    if self.high_quality_updated_at_changed?
      conversion_url = URI.parse(ConversionSettings["url"])
      audio_url = "#{ConversionSettings["host"]}/audios/#{self.id}.xml"

      Net::HTTP.new(conversion_url.host).post('/convert', "file=#{self.high_quality.url}&url=#{audio_url}")
    end
  end
end