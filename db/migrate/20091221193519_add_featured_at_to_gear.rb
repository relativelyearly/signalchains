class AddFeaturedAtToGear < ActiveRecord::Migration
  def self.up
    add_column :mics, :featured_at, :datetime
    add_column :preamps, :featured_at, :datetime
    add_column :equalizers, :featured_at, :datetime
    add_column :effects_processors, :featured_at, :datetime
    add_column :dynamics_processors, :featured_at, :datetime

    add_column :chains, :featured_at, :datetime
  end

  def self.down
    remove_column :mics, :featured_at
    remove_column :preamps, :featured_at
    remove_column :equalizers, :featured_at
    remove_column :effects_processors, :featured_at
    remove_column :dynamics_processors, :featured_at

    remove_column :chains, :featured_at
  end
end
