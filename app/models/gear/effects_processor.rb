class EffectsProcessor < Gear
  attr_accessible :effects_type, :interface

  def self.effects_types
    ['Reverb', 'Delay', 'Chorus', 'Other']
  end

  def self.index_partial
    'effects_processors/effects_processor'
  end

  def chain_gear_partial
    'effects_processors/effects_processor_info'
  end

  def self.interfaces
    ['Hardware', 'Software']
  end
end