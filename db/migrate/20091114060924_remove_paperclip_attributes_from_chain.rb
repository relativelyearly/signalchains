class RemovePaperclipAttributesFromChain < ActiveRecord::Migration
  def self.up
    remove_column :chains, :audio_file_name
    remove_column :chains, :audio_content_type
    remove_column :chains, :audio_file_size
    remove_column :chains, :audio_updated_at
  end

  def self.down
    add_column :chains, :audio_updated_at, :datetime
    add_column :chains, :audio_file_size, :integer
    add_column :chains, :audio_content_type, :string
    add_column :chains, :audio_file_name, :string
  end
end