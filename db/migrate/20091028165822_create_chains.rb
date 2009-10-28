class CreateChains < ActiveRecord::Migration
  def self.up
    create_table :chains do |t|
    t.belongs_to :user
    t.string :status
    t.string :name
    t.text :notes
    t.string :audio_file_name
    t.string :audio_content_type
    t.integer :audio_file_size
    t.datetime :audio_updated_at
    t.string :title
    t.string :performer
    t.string :year
    t.string :studio
    t.timestamps
    end
  end
  
  def self.down
    drop_table :chains
  end
end