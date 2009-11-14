class AddOggToAudios < ActiveRecord::Migration
  def self.up
    rename_column :audios, :converted_file_name, :mp3_file_name
    rename_column :audios, :converted_content_type, :mp3_content_type
    rename_column :audios, :converted_file_size, :mp3_file_size
    rename_column :audios, :converted_updated_at, :mp3_updated_at

    add_column :audios, :ogg_file_name, :string
    add_column :audios, :ogg_content_type, :string
    add_column :audios, :ogg_file_size, :integer
    add_column :audios, :ogg_updated_at, :datetime
  end

  def self.down
    remove_column :audios, :ogg_updated_at
    remove_column :audios, :ogg_file_size
    remove_column :audios, :ogg_content_type
    remove_column :audios, :ogg_file_name

    rename_column :audios, :mp3_file_name,    :converted_file_name
    rename_column :audios, :mp3_content_type, :converted_content_type
    rename_column :audios, :mp3_file_size,    :converted_file_size
    rename_column :audios, :mp3_updated_at,   :converted_updated_at
  end
end