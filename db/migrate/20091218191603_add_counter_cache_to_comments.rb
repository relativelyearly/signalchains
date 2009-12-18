class AddCounterCacheToComments < ActiveRecord::Migration
  def self.up
    add_column :chains, :comments_count, :integer, :default => 0
    add_column :mics, :comments_count, :integer, :default => 0
    add_column :preamps, :comments_count, :integer, :default => 0
    add_column :equalizers, :comments_count, :integer, :default => 0
    add_column :dynamics_processors, :comments_count, :integer, :default => 0
    add_column :effects_processors, :comments_count, :integer, :default => 0
  end

  def self.down
    remove_column :chains, :comments_count
    remove_column :mics, :comments_count
    remove_column :preamps, :comments_count
    remove_column :equalizers, :comments_count
    remove_column :dynamics_processors, :comments_count
    remove_column :effects_processors, :comments_count
  end
end
