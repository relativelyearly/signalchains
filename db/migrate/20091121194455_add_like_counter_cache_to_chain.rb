class AddLikeCounterCacheToChain < ActiveRecord::Migration
  def self.up
    add_column :chains, :likes_count, :integer, :default => 0
  end

  def self.down
    remove_column :chains, :likes_count
  end
end
