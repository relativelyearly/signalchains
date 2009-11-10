class Mic < Gear
  attr_accessible :mic_type, :diaphragm_size, :pattern

  def self.types
    ['Condenser', 'Dynamic', 'Ribbon', 'PZM']
  end

  def self.diaphragm_sizes
    ['Small', 'Medium', 'Large']
  end

  def self.patterns
    ['Cardioid', 'Omni', 'Bi', 'Supercardioid', 'XY', 'ORTF', 'Spaced Pair', 'MS Stereo', 'Blumlein']
  end

  def partial
    'mics/mic'
  end

  def input_source?
    true
  end

  def position
    0
  end

  def partial
    'mics/mic'
  end
end