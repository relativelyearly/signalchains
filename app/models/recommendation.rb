# == Schema Information
# Schema version: 20100127165047
#
# Table name: recommendations
#
#  id                 :integer(4)      not null, primary key
#  recommendable_id   :integer(4)
#  recommendable_type :string(255)
#  user_id            :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

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
