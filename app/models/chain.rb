class Chain < ActiveRecord::Base
  attr_accessible :user_id, :status, :name, :notes, :title, :performer, :year, :tag_list, :audio_attributes
  acts_as_taggable_on :tags

  belongs_to :user
  has_many :gear, :class_name => 'ChainGear', :include => [:gear]
  has_many :likes, :dependent => :destroy
  has_many :comments, :as => :commentable, :include => [:user], :dependent => :destroy
  has_one :audio, :as => :audible, :dependent => :destroy
  accepts_nested_attributes_for :audio, :allow_destroy => true

  before_save :update_completion

  fires :new_chain, :on => :create,
                    :actor => :user

  named_scope :complete, :conditions => {:status => 'complete'}

  def preamp?
     gear.any? {|gear| gear.preamp?}
  end

  def input_source?
    gear.any? {|gear| gear.input_source?}
  end

  def input_source(options={})
    gear.all(options).select {|g| g.input_source?}.first
  end

  def preamp(options={})
    gear.all(options).select {|g| g.preamp?}.first
  end

  def processors(options={})
    gear.all(options).select {|g| !g.input_source? && !g.preamp?}
  end

  def complete?
    self.status == 'complete'
  end

  def update_completion
    completion = 'draft'

    if input_source? && preamp? && audio && audio.file.file?
      completion = 'complete'
    end

    self.status = completion
  end
end
