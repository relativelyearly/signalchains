class CreateTimelineEvents < ActiveRecord::Migration
  def self.up
    create_table :timeline_events do |t|
      t.string   :event_type, :subject_type,  :actor_type,  :secondary_subject_type
      t.integer               :subject_id,    :actor_id,    :secondary_subject_id
      t.timestamps
    end

    create_table :user_timeline_events do |t|
      t.integer  :target_id, :timeline_event_id
      t.timestamps
    end
  end

  def self.down
    drop_table :timeline_events
    drop_table :user_timeline_events
  end
end


