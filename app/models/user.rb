class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :password, :password_confirmation, :email

  has_many :likes, :dependent => :destroy
  has_many :follows, :dependent => :destroy
  has_many :followed_users, :through => :follows, :source => :followed

  def likes?(chain)
    self.likes.find(:first, :conditions => {:chain_id => chain.id})
  end

  def follows?(user)
    self.follows.find(:first, :conditions => {:followed_id => user.id})
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end
