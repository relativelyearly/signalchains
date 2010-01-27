class Recommendation < ActiveRecord::Base
  attr_accessible :recommendable_id, :recommendable_type, :user_id

  belongs_to :recommendable, :polymorphic => true, :counter_cache => true
  belongs_to :user

  validates_uniqueness_of :recommendable_id, :scope => [:user_id, :recommendable_type]

  fires :recommends, :on => :create,
                     :actor => :user,
                     :subject => :recommendable,
                     :for => lambda {|recommendation| recommendation.user.followers}
end