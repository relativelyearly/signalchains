class Like < ActiveRecord::Base
  attr_accessible :chain_id, :user_id

  belongs_to :chain, :counter_cache => true
  belongs_to :user

  validates_uniqueness_of :chain_id, :scope => [:user_id]
end