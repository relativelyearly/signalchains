Factory.define :mic do |mic|
  mic.mic_type        Mic.types.first
  mic.diaphragm_size  Mic.diaphragm_sizes.first
  mic.pattern         Mic.patterns.first
end