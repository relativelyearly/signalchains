raw_config = File.read(Rails.root.join('config', 'conversion.yml'))

ConversionSettings = YAML.load(raw_config)[Rails.env]