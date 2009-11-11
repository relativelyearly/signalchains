class Equalizer < Gear
  attr_accessible :bands, :interface, :equalizer_type

  def self.equalizer_types
    ['Parametric', 'Graphic']
  end

  def self.interfaces
    ['Hardware', 'Software']
  end

  def partial
    'equalizers/equalizer_info'
  end
end