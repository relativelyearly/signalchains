class RemoveStudioFromChain < ActiveRecord::Migration
  def self.up
    remove_column :chains, :studio
  end

  def self.down
    add_column :chains, :studio, :string
  end
end
