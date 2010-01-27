class AddRecommendationsCountToGear < ActiveRecord::Migration
  def self.up
    [:converters, :dynamics_processors, :effects_processors, :equalizers, :mics, :preamps].each do |table|
      add_column table, :recommendations_count, :integer
    end
  end

  def self.down
    [:converters, :dynamics_processors, :effects_processors, :equalizers, :mics, :preamps].each do |table|
      remove_column table, :recommendations_count
    end
  end
end
