class MoveToPaperclipProcessorsForAudio < ActiveRecord::Migration
  def self.up
    remove_column :audios, :high_quality_file_name
    remove_column :audios, :high_quality_content_type
    remove_column :audios, :high_quality_file_size
    remove_column :audios, :high_quality_updated_at

    remove_column :audios, :mp3_file_name
    remove_column :audios, :mp3_content_type
    remove_column :audios, :mp3_file_size
    remove_column :audios, :mp3_updated_at

    remove_column :audios, :ogg_file_name
    remove_column :audios, :ogg_content_type
    remove_column :audios, :ogg_file_size
    remove_column :audios, :ogg_updated_at

    add_column :audios, :file_file_name, :string
    add_column :audios, :file_content_type, :string
    add_column :audios, :file_file_size, :integer
    add_column :audios, :file_updated_at, :datetime
  end

  def self.down
    remove_column :audios, :file_updated_at
    remove_column :audios, :file_file_size
    remove_column :audios, :file_content_type
    remove_column :audios, :file_file_name

    add_column :audios, :high_quality_updated_at, :datetime
    add_column :audios, :high_quality_file_size, :integer
    add_column :audios, :high_quality_content_type, :string
    add_column :audios, :high_quality_file_name, :string

    add_column :audios, :mp3_updated_at, :datetime
    add_column :audios, :mp3_file_size, :integer
    add_column :audios, :mp3_content_type, :string
    add_column :audios, :mp3_file_name, :string

    add_column :audios, :ogg_updated_at, :datetime
    add_column :audios, :ogg_file_size, :integer
    add_column :audios, :ogg_content_type, :string
    add_column :audios, :ogg_file_name, :string
  end
end
