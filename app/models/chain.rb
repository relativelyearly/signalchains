class Chain < ActiveRecord::Base
  attr_accessible :user_id, :status, :name, :notes, :audio, :title, :performer, :year, :tag_list
  acts_as_taggable_on :tags

  has_attached_file :audio,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:extension'

  belongs_to :user
  has_many :gear, :class_name => 'ChainGear'

  before_save :complete?

  named_scope :complete, :conditions => {:status => 'complete'}

  def preamp?
     gear.any? {|gear| gear.preamp?}
  end

  def input_source?
    gear.any? {|gear| gear.input_source?}
  end

  def input_source
    gear.select {|g| g.input_source?}.first
  end

  def processors
    gear.select {|g| !g.input_source?}
  end

  private
  def complete?
    completion = 'draft'

    if input_source? && preamp? && audio.file?
      completion = 'complete'
    end

    self.status = completion
  end
end