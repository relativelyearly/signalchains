class Mic < Gear
  attr_accessible :mic_type, :diaphragm_size, :pattern

  def self.types
    ['Condenser']
  end

  def self.diaphragm_sizes
    ['Large']
  end

  def self.patterns
    ['Cardioid']
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