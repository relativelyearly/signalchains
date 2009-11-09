class Gear < ActiveRecord::Base
  self.abstract_class = true

  attr_accessible :make, :model, :manufactured_date, :image
  has_attached_file :image
end