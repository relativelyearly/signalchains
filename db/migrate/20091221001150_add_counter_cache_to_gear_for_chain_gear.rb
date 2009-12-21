class AddCounterCacheToGearForChainGear < ActiveRecord::Migration
  def self.up
    add_column :mics, :chain_gears_count, :integer, :default => 0
    add_column :preamps, :chain_gears_count, :integer, :default => 0
    add_column :equalizers, :chain_gears_count, :integer, :default => 0
    add_column :effects_processors, :chain_gears_count, :integer, :default => 0
    add_column :dynamics_processors, :chain_gears_count, :integer, :default => 0
  end

  def self.down
    remove_column :mics, :chain_gears_count
    remove_column :preamps, :chain_gears_count
    remove_column :equalizers, :chain_gears_count
    remove_column :effects_processors, :chain_gears_count
    remove_column :dynamics_processors, :chain_gears_count
  end
end
