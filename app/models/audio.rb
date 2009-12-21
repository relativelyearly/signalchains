# == Schema Information
#
# Table name: audios
#
#  id                :integer(4)      not null, primary key
#  status            :string(255)     default("converting")
#  created_at        :datetime
#  updated_at        :datetime
#  audible_id        :integer(4)
#  audible_type      :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer(4)
#  file_updated_at   :datetime
#

require 'net/http'

class Audio < ActiveRecord::Base
  attr_accessible :file, :status

  belongs_to :audible, :polymorphic => true
  after_destroy :update_chain_status

  has_attached_file :file,
                    :styles => {
                      :ogg => {:ogg => {:bitrate => '128k'}},
                      :mp3 => {:mp3 => {:bitrate => '128k'}}
                    },
                    :processors => [:mp3, :ogg],
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:content_type_extension'

  validates_attachment_content_type :file,
                                    :content_type => ['audio/aiff', 'audio/x-aiff', 'audio/wav', 'audio/x-wav'],
                                    :message => 'The audio file must be an aiff or a wav'
  validates_attachment_size :file,
                            :less_than => 5.5.megabytes,
                            :message => 'The audio file must be less than 30 seconds'

  private
  def update_chain_status
    if self.audible.respond_to? :update_completion
      audible = self.audible
      audible.update_completion
      audible.save
    end
  end
end
