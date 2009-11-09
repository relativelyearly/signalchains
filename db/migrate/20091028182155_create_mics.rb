class CreateMics < ActiveRecord::Migration
  def self.up
    create_table :mics do |t|
    t.string :make
    t.string :model
    t.string :manufactured_date
    t.string :image_file_name
    t.string :image_content_type
    t.integer :image_file_size
    t.datetime :image_updated_at
    t.string :mic_type
    t.string :diaphragm_size
    t.string :pattern
    t.timestamps
    end
  end
  
  def self.down
    drop_table :mics
  end
end