class AddAssociationToAudio < ActiveRecord::Migration
  def self.up
    add_column :audios, :audible_id, :integer
    add_column :audios, :audible_type, :string
  end

  def self.down
    remove_column :audios, :audible_type
    remove_column :audios, :audible_id
  end
end
