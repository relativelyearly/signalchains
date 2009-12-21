# == Schema Information
#
# Table name: chain_gears
#
#  id         :integer         not null, primary key
#  gear_id    :integer
#  gear_type  :string(255)
#  chain_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  notes      :text
#  position   :integer         default(2)
#

class ChainGear < ActiveRecord::Base
  attr_accessible :gear_id, :gear_type, :chain_id, :notes

  belongs_to :chain, :touch => true
  belongs_to :gear, :polymorphic => true

  before_create :set_position

  def input_source?
    gear.nil? || gear_type == 'Mic'
  end

  def preamp?
    gear_type == 'Preamp'
  end

  private
  def set_position
    self.position = self.gear.position unless self.gear.nil?
    self.position = 0 if self.gear.nil?
  end
end
