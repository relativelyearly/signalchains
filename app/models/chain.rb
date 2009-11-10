class Chain < ActiveRecord::Base
  attr_accessible :user_id, :status, :name, :notes, :audio, :title, :performer, :year, :studio, :tag_list
  acts_as_taggable_on :tags

  has_attached_file :audio

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

  private
  def complete?
    completion = 'draft'

    if input_source? && preamp? && audio.file?
      completion = 'complete'
    end

    self.status = completion
  end
end