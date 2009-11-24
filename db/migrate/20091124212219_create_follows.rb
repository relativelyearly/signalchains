class CreateFollows < ActiveRecord::Migration
  def self.up
    create_table :follows do |t|
    t.belongs_to :user
    t.integer :followed_id
    t.timestamps
    end
  end
  
  def self.down
    drop_table :follows
  end
end