class Ad < ActiveRecord::Base
  attr_accessible :image, :url

  has_attached_file(:image, :styles => {:display => ['130x100#', :jpg]})
end