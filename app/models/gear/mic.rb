class Mic < Gear
  attr_accessible :mic_type, :diaphragm_size, :pattern

  def self.types
    ['Condenser', 'Dynamic', 'Ribbon', 'PZM', 'Tube']
  end

  def self.diaphragm_sizes
    ['Small', 'Medium', 'Large']
  end

  def self.patterns
    ['Cardioid', 'Omni', 'Bi', 'Supercardioid', 'XY', 'ORTF', 'Spaced Pair', 'MS Stereo', 'Blumlein']
  end

  def self.index_partial
    'mics/microphone'
  end

  def chain_gear_partial
    'mics/mic'
  end

  def input_source?
    true
  end

  def position
    0
  end
end