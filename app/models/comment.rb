# == Schema Information
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  commentable_id   :integer
#  commentable_type :string(255)
#  body             :text
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :body, :user_id

  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  belongs_to :user

  fires :commented, :on => :create,
                    :actor => :user,
                    :secondary_subject => :commentable
end
