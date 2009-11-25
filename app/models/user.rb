class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :password, :password_confirmation, :email

  has_many :likes, :dependent => :destroy
  has_many :follows, :dependent => :destroy
  has_many :followed_users, :through => :follows, :source => :followed
  has_many :events_about_self, :as => :subject, :class_name => "TimelineEvent", :order => "timeline_events.created_at DESC"

  EventConditions = '(actor_type = \'User\' AND actor_id IN (SELECT followed_id FROM follows WHERE follows.user_id = #{id}))
                     OR (secondary_subject_type = \'Chain\' AND secondary_subject_id IN (SELECT chain_id FROM likes WHERE likes.user_id = #{id}))
                     OR (secondary_subject_type = \'Chain\' AND secondary_subject_id IN (SELECT id FROM chains WHERE chains.user_id = #{id}))
                     OR (subject_type = \'Chain\' AND actor_type = \'User\' AND actor_id IN (SELECT followed_id FROM follows WHERE follows.user_id = #{id}))'
  has_many :events, :class_name => "TimelineEvent",
                    :order => "timeline_events.created_at DESC",
                    :finder_sql => "SELECT timeline_events.* FROM timeline_events WHERE #{EventConditions}",
                    :counter_sql => "SELECT COUNT(*) FROM timeline_events WHERE #{EventConditions}"
                    

  def likes?(chain)
    self.likes.find(:first, :conditions => {:chain_id => chain.id})
  end

  def follows?(user)
    self.follows.find(:first, :conditions => {:followed_id => user.id})
  end

  def events_about_self
    []
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end
