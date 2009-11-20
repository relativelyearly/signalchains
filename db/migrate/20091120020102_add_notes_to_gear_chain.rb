class AddNotesToGearChain < ActiveRecord::Migration
  def self.up
    add_column :chain_gears, :notes, :text
  end

  def self.down
    remove_column :chain_gears, :notes
  end
end
