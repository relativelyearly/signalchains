# == Schema Information
# Schema version: 20100127165047
#
# Table name: converters
#
#  id                    :integer(4)      not null, primary key
#  make                  :string(255)
#  model                 :string(255)
#  image_file_name       :string(255)
#  image_content_type    :string(255)
#  image_file_size       :integer(4)
#  image_updated_at      :datetime
#  chain_gears_count     :integer(4)      default(0)
#  featured_at           :datetime
#  delta                 :boolean(1)      default(TRUE), not null
#  created_at            :datetime
#  updated_at            :datetime
#  recommendations_count :integer(4)
#

class Converter < Gear
  define_index do
    indexes :make
    indexes :model

    has :updated_at, :created_at, :chain_gears_count, :featured_at, :recommendations_count
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
