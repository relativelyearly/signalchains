class AddThinkingSphinxDeltas < ActiveRecord::Migration
  def self.up
    add_column :chains, :delta, :boolean, :default => true, :null => false
    add_column :users, :delta, :boolean, :default => true, :null => false
    add_column :mics, :delta, :boolean, :default => true, :null => false
    add_column :preamps, :delta, :boolean, :default => true, :null => false
    add_column :equalizers, :delta, :boolean, :default => true, :null => false
    add_column :effects_processors, :delta, :boolean, :default => true, :null => false
    add_column :dynamics_processors, :delta, :boolean, :default => true, :null => false
  end

  def self.down
    remove_column :chains, :delta
    remove_column :users, :delta
    remove_column :mics, :delta
    remove_column :preamps, :delta
    remove_column :equalizers, :delta
    remove_column :effects_processors, :delta
    remove_column :dynamics_processors, :delta
  end
end
