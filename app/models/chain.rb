# == Schema Information
#
# Table name: chains
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  status         :string(255)
#  name           :string(255)
#  notes          :text
#  title          :string(255)
#  performer      :string(255)
#  year           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  likes_count    :integer(4)      default(0)
#  comments_count :integer(4)      default(0)
#  featured_at    :datetime
#

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

  define_index do
    indexes :name
    indexes :notes
    indexes :title
    indexes :performer
    indexes :year

    indexes user(:login)
    indexes user(:display_name)

    has :likes_count, :updated_at, :created_at
    set_property :delta => true
    set_property :enable_star => true
    set_property :min_prefix_len => 3
  end

  def self.featured
    @featured ||= Chain.complete.first(:conditions => "featured_at is not null", :order => 'featured_at DESC')
  end

  def input_source_image(style = :original)
    if input_source.gear
      input_source.gear.image.url(style)
    else
      "/images/#{style}_line_in.png"
    end
  end

  def input_source_model
    if input_source.gear
      input_source.gear.model
    else
      'line in'
    end
  end

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
