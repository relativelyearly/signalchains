class UserTimelineEvent < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :timeline_event
end
