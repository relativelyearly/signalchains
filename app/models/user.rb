# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  crypted_password    :string(255)
#  password_salt       :string(255)
#  email               :string(255)
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  login_count         :integer(4)
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  display_name        :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  type                :string(255)
#  slug                :string(255)
#  login               :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer(4)
#  avatar_updated_at   :datetime
#  roles               :string(255)
#

class User < ActiveRecord::Base
  include Tender::MultiPassMethods

  tender_multipass do |user|
    {:external_id => user.id, :name => user.login, :email => user.email}
  end

  acts_as_authentic

  attr_accessible :password, :password_confirmation, :email, :login,
                  :display_name, :avatar

  before_validation_on_create :make_default_roles

  validates_exclusion_of :login, :in => %w(comments chains equalizers effects_processors dynamics_processors
                                           preamps mics audios chain_gears account password_resets users
                                           user_sessions gear login logout register admin)

  has_many :likes, :dependent => :destroy
  has_many :liked_chains, :through => :likes, :source => :chain
  has_many :follows, :dependent => :destroy
  has_many :followed_users, :through => :follows, :source => :followed
  has_many :events_about_self, :foreign_key => :actor_id, :class_name => "TimelineEvent", :order => "timeline_events.created_at DESC"
  has_many :chains

  EventConditions = '((actor_type = \'User\' AND actor_id IN (SELECT followed_id FROM follows WHERE follows.user_id = #{id}))
                     OR (secondary_subject_type = \'Chain\' AND secondary_subject_id IN (SELECT chain_id FROM likes WHERE likes.user_id = #{id}))
                     OR (secondary_subject_type = \'Chain\' AND secondary_subject_id IN (SELECT id FROM chains WHERE chains.user_id = #{id}))
                     OR (subject_type = \'Chain\' AND actor_type = \'User\' AND actor_id IN (SELECT followed_id FROM follows WHERE follows.user_id = #{id})))
                     AND actor_id != #{id}'
  has_many :events, :class_name => "TimelineEvent",
                    :order => "timeline_events.created_at DESC",
                    :finder_sql => "SELECT timeline_events.* FROM timeline_events WHERE #{EventConditions}",
                    :counter_sql => "SELECT COUNT(*) FROM timeline_events WHERE #{EventConditions}"

  has_attached_file :avatar,
                    :styles => { :thumb => ["80x80#", :jpg], :wide => ["250x130", :jpg], :display => ["500x500", :jpg] },
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:extension'

  serialize :roles, Array

  define_index do
    indexes :email
    indexes :login, :sortable => true
    indexes :display_name

    has :created_at, :updated_at
  end

  def admin?
    has_role?("admin")
  end
  
  def has_role?(role)
    roles.include?(role)
  end
     
  def has_any_role?(*roles)
    roles.each do |role|
      return true if has_role?(role)
    end
    false
  end
 
  def add_role(role)
    self.roles << role unless self.has_role?(role)
  end
     
  def remove_role(role)
    self.roles.delete(role)
  end
  
  def clear_roles
    self.roles = []
  end

  def display_name
    display_name = read_attribute(:display_name)
    display_name = self.login if display_name.nil? || display_name.empty?
    display_name
  end

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

  def self.find_by_login_or_email(login)
    User.find_by_login(login) || User.find_by_email(login)
  end
  
  private
  def make_default_roles
    clear_roles if roles.nil?
  end
end
