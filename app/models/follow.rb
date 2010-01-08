# == Schema Information
#
# Table name: follows
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  followed_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Follow < ActiveRecord::Base
  attr_accessible :user_id, :followed_id

  belongs_to :user
  belongs_to :followed, :class_name => 'User'

  fires :following, :on => :create,
                    :actor => :user,
                    :subject => :followed,
                    :for => lambda {|follow| follow.user.followers}
end
