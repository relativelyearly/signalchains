class EffectsProcessor < Gear
  attr_accessible :effects_type, :interface

  def self.effects_types
    ['Reverb', 'Delay', 'Chorus', 'Other']
  end

  def partial
    'effects_processors/effects_processor'
  end

  def self.interfaces
    ['Hardware', 'Software']
  end
end