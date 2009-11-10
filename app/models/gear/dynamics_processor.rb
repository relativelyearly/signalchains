class DynamicsProcessor < Gear
  attr_accessible :circuitry, :compression_type, :dynamics_type, :interface

  def self.dynamics_types
    ['Compressor', 'Limiter', 'Expander', 'DeEsser']
  end

  def self.circuitries
    ['Solid State', 'Tube']
  end

  def self.compression_types
    ['FET', 'RMS', 'Optical']
  end

  def self.interfaces
    ['Hardware', 'Software']
  end

  def partial
    'dynamics_processors/dynamics_processor'
  end
end