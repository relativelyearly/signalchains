class Follow < ActiveRecord::Base
  attr_accessible :user_id, :followed_id

  belongs_to :user
  belongs_to :followed, :class_name => 'User'
end