require 'rubygems'
require 'active_record'
require 'mocha'
require 'test/unit'
require 'logger'

require File.dirname(__FILE__)+'/../lib/timeline_fu'

ActiveRecord::Base.configurations = {'sqlite3' => {:adapter => 'sqlite3', :database => ':memory:'}}
ActiveRecord::Base.establish_connection('sqlite3')

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.logger.level = Logger::WARN

ActiveRecord::Schema.define(:version => 0) do
  create_table :people do |t|
    t.string  :email,    :default => ''
    t.string  :password, :default => ''
  end

  create_table :lists do |t|
    t.integer :author_id
    t.string  :title
  end

  create_table :list_with_fors do |t|
    t.integer :author_id
    t.string  :title
  end

  create_table :comments do |t|
    t.integer :list_id, :author_id
    t.string  :body
  end

  create_table :timeline_events do |t|
    t.string   :event_type, :subject_type,  :actor_type,  :secondary_subject_type
    t.integer               :subject_id,    :actor_id,    :secondary_subject_id
    t.timestamps
  end
end

class Person < ActiveRecord::Base
  attr_accessor :new_watcher, :fire

  fires :follow_created,  :on     => :update,
                          :actor  => :new_watcher,
                          :if     => lambda { |person| !person.new_watcher.nil? }
  fires :person_updated,  :on     => :update,
                          :if     => :fire?

  def fire?
    new_watcher.nil? && fire
  end
end

class List < ActiveRecord::Base
  belongs_to :author, :class_name => "Person"
  has_many :comments

  fires :list_created_or_updated,  :actor  => :author,
                                   :on     => [:create, :update]
end

class ListWithFor < ActiveRecord::Base
  belongs_to :author, :class_name => "Person"
  has_many :comments

  fires :list_created_or_updated,  :actor  => :author,
                                   :on     => [:create, :update],
                                   :for    => :target

  def target
    self.author
  end
end

class Comment < ActiveRecord::Base
  belongs_to :list
  belongs_to :author, :class_name => "Person"

  fires :comment_created, :actor   => :author,
                          :on      => :create,
                          :secondary_subject => :list
  fires :comment_deleted, :actor   => :author,
                          :on      => :destroy,
                          :subject => :list,
                          :secondary_subject => :self
end

class TimelineEvent < ActiveRecord::Base
  belongs_to :actor,              :polymorphic => true
  belongs_to :subject,            :polymorphic => true
  belongs_to :secondary_subject,  :polymorphic => true
end

UserTimelineEvent = Class.new

class Test::Unit::TestCase
  include Mocha::ParameterMatchers

  protected
    def hash_for_list(opts = {})
      {:title => 'whatever'}.merge(opts)
    end

    def create_list(opts = {})
      List.create!(hash_for_list(opts))
    end

    def hash_for_person(opts = {})
      {:email => 'james'}.merge(opts)
    end

    def create_person(opts = {})
      Person.create!(hash_for_person(opts))
    end
end
