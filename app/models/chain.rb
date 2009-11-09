class Chain < ActiveRecord::Base
  attr_accessible :user_id, :status, :name, :notes, :audio, :title, :performer, :year, :studio, :tag_list
  acts_as_taggable_on :tags

  has_attached_file :audio

  belongs_to :user
  has_many :gear, :class_name => 'ChainGear'
end