require 'net/http'

class Audio < ActiveRecord::Base
  attr_accessible :high_quality, :mp3, :ogg, :status, :mp3_file_size,
                  :mp3_file_name, :mp3_content_type,
                  :mp3_updated_at, :ogg_file_size,
                  :ogg_file_name, :ogg_content_type,
                  :ogg_updated_at

  belongs_to :audible, :polymorphic => true

  before_save :update_status, :convert

  has_attached_file :high_quality,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:extension'

  has_attached_file :mp3,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:extension'

  has_attached_file :ogg,
                  :storage => :s3,
                  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                  :path => ':class/:id/:style.:extension'

  private
  def update_status
    if self.high_quality_updated_at_changed?
      self.status = 'converting'
    elsif self.mp3_updated_at_changed?
      self.status = 'converted'
    end
  end

  def convert
    return if Rails.env == 'test'
    if self.high_quality_updated_at_changed?
      conversion_url = URI.parse(ConversionSettings["url"])
      audio_url = "#{ConversionSettings["host"]}/audios/#{self.id}.xml"

      Net::HTTP.new(conversion_url.host).post('/convert', "file=#{self.high_quality.url}&url=#{audio_url}")
    end
  end
end