class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :body, :user_id

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  fires :commented, :on => :create,
                    :actor => :user,
                    :secondary_subject => :commentable
end