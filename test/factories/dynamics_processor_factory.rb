Factory.define :dynamics_processor do |dynamics_processor|
  dynamics_processor.dynamics_type     DynamicsProcessor.dynamics_types.first
  dynamics_processor.circuitry         DynamicsProcessor.circuitries.first
  dynamics_processor.compression_type  DynamicsProcessor.compression_types.first
end