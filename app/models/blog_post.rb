# == Schema Information
# Schema version: 20100202185123
#
# Table name: blog_posts
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  content    :text
#  author_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class BlogPost < ActiveRecord::Base
  attr_accessible :title, :content, :author_id

  validates_presence_of :title, :content, :author_id

  belongs_to :author, :class_name => 'User'
  has_many :comments, :as => :commentable, :dependent => :destroy

  default_scope :order => 'created_at DESC'

  def to_param
    "#{self.id}-#{self.title.to_url}"
  end
end
