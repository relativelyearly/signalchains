class CreateDynamicsProcessors < ActiveRecord::Migration
  def self.up
    create_table :dynamics_processors do |t|
    t.string :make
    t.string :model
    t.string :manufactured_date
    t.string :image_file_name
    t.string :image_content_type
    t.integer :image_file_size
    t.datetime :image_updated_at
    t.string :circuitry
    t.string :compression_type
    t.string :dynamics_type
    t.string :interface
    t.timestamps
    end
  end

  def self.down
    drop_table :dynamics_processors
  end
end