class CreateChainGears < ActiveRecord::Migration
  def self.up
    create_table :chain_gears do |t|
    t.integer :gear_id
    t.string :gear_type
    t.integer :chain_id
    t.timestamps
    end
  end
  
  def self.down
    drop_table :chain_gears
  end
end