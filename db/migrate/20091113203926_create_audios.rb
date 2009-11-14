class CreateAudios < ActiveRecord::Migration
  def self.up
    create_table :audios do |t|
    t.string :high_quality_file_name
    t.string :high_quality_content_type
    t.integer :high_quality_file_size
    t.datetime :high_quality_updated_at
    t.string :converted_file_name
    t.string :converted_content_type
    t.integer :converted_file_size
    t.datetime :converted_updated_at
    t.string :status, :default => 'converting'
    t.timestamps
    end
  end

  def self.down
    drop_table :audios
  end
end