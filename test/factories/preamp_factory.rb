Factory.define :preamp do |preamp|
  preamp.make "Make"
  preamp.model "Model"
  preamp.circuitry Preamp.circuitries.first
end
