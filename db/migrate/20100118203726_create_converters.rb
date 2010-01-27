class CreateConverters < ActiveRecord::Migration
  def self.up
    create_table :converters do |t|
    t.string :make
    t.string :model
    t.string :image_file_name
    t.string :image_content_type
    t.integer :image_file_size
    t.datetime :image_updated_at
    t.integer :chain_gears_count, :default => 0
    t.datetime :featured_at
    t.boolean :delta, :default => true, :null => false

    t.timestamps
    end
  end
  
  def self.down
    drop_table :converters
  end
end