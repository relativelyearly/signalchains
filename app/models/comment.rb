# == Schema Information
#
# Table name: comments
#
#  id               :integer(4)      not null, primary key
#  commentable_id   :integer(4)
#  commentable_type :string(255)
#  body             :text
#  user_id          :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :body, :user_id

  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  belongs_to :user

  fires :commented, :on => :create,
                    :actor => :user,
                    :secondary_subject => :commentable,
                    :for => :target

  def target
    target = self.user.followers
    target += Array(self.commentable.user) if self.commentable.respond_to?(:user)
    target.delete_if {|t| t == self.user}.uniq
  end
end
