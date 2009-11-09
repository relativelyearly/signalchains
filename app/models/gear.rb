class Gear < ActiveRecord::Base
  self.abstract_class = true

  attr_accessible :make, :model, :manufactured_date, :image

  has_many :chain_gears, :as => :gear
  has_many :chains, :through => :chain_gears

  has_attached_file :image, :styles => { :thumb => ["100x100#", :jpg] }
end