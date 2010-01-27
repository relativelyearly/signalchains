class Converter < Gear
  define_index do
    indexes :make
    indexes :model

    has :updated_at, :created_at, :chain_gears_count, :featured_at
    set_property :delta => true
    set_property :enable_star => true
    set_property :min_prefix_len => 3
  end

  def self.index_partial
    'converters/converter'
  end

  def chain_gear_partial
    'converters/converter_info'
  end
end