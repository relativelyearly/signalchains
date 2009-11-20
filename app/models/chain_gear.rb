class ChainGear < ActiveRecord::Base
  attr_accessible :gear_id, :gear_type, :chain_id, :notes
  belongs_to :chain
  belongs_to :gear, :polymorphic => true

  def input_source?
    gear.nil? || gear_type == 'Mic'
  end

  def preamp?
    gear_type == 'Preamp'
  end

  def position
    gear.position
  end
end