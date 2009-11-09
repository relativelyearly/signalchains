class ChainGear < ActiveRecord::Base
  attr_accessible :gear_id, :gear_type, :chain_id
  belongs_to :chain
  belongs_to :gear, :polymorphic => true
end