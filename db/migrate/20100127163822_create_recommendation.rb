class CreateRecommendation < ActiveRecord::Migration
  def self.up
    create_table :recommendations do |t|
      t.integer :recommendable_id
      t.string :recommendable_type
      t.belongs_to :user
      t.timestamps
    end
  end

  def self.down
    drop_table :recommendations
  end
end
