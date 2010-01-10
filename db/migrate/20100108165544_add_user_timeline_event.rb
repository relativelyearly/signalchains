class AddUserTimelineEvent < ActiveRecord::Migration
  def self.up
    create_table :user_timeline_events do |t|
      t.integer  :target_id, :timeline_event_id
      t.string   :target_type
      t.timestamps
    end
  end

  def self.down
    drop_table :user_timeline_events
  end
end
