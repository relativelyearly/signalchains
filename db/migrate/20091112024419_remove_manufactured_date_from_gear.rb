class RemoveManufacturedDateFromGear < ActiveRecord::Migration
  def self.up
    [:mics, :dynamics_processors, :effects_processors, :equalizers, :preamps].each do |table|
      remove_column table, :manufactured_date
    end
  end

  def self.down
    [:mics, :dynamics_processors, :effects_processors, :equalizers, :preamps].each do |table|
      add_column table, :manufactured_date, :string
    end
  end
end
