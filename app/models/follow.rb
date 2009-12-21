# == Schema Information
#
# Table name: follows
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  followed_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Follow < ActiveRecord::Base
  attr_accessible :user_id, :followed_id

  belongs_to :user
  belongs_to :followed, :class_name => 'User'
end
