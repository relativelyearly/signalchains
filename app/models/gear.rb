class Gear < ActiveRecord::Base
  self.abstract_class = true

  attr_accessible :make, :model, :image

  has_many :chain_gears, :as => :gear
  has_many :chains, :through => :chain_gears
  has_many :comments, :as => :commentable, :dependent => :destroy

  has_attached_file :image,
                    :styles => { :thumb => ["100x100#", :jpg], :wide => ["250x130", :jpg], :display => ["370x500"] },
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:extension'

  def position
    2
  end

  def score
    90
  end

  def name
    "#{self.make} #{self.model}"
  end
end