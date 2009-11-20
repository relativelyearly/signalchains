class Preamp < Gear
  attr_accessible :circuitry

  def self.circuitries
    ['Solid State', 'Tube']
  end

  def self.index_partial
    'preamps/preamp'
  end

  def chain_gear_partial
    'preamps/preamp_info'
  end

  def position
    1
  end
end