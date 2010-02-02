class BlogPost < ActiveRecord::Base
  attr_accessible :title, :content, :author_id

  validates_presence_of :title, :content, :author_id

  belongs_to :author, :class_name => 'User'

  default_scope :order => 'created_at DESC'

  def to_param
    "#{self.id}-#{self.title.to_url}"
  end
end