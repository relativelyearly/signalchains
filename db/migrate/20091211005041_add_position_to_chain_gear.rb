class AddPositionToChainGear < ActiveRecord::Migration
  def self.up
    add_column :chain_gears, :position, :integer, :default => 2
  end

  def self.down
    remove_column :chain_gears, :position
  end
end
