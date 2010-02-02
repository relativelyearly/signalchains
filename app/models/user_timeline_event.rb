# == Schema Information
# Schema version: 20100127165047
#
# Table name: user_timeline_events
#
#  id                :integer(4)      not null, primary key
#  target_id         :integer(4)
#  timeline_event_id :integer(4)
#  target_type       :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class UserTimelineEvent < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :timeline_event
end
