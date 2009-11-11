class Preamp < Gear
  attr_accessible :circuitry

  def self.circuitries
    ['Solid State', 'Tube']
  end

  def partial
    'preamps/preamp_info'
  end

  def position
    1
  end
end