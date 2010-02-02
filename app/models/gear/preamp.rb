# == Schema Information
# Schema version: 20100127165047
#
# Table name: preamps
#
#  id                    :integer(4)      not null, primary key
#  make                  :string(255)
#  model                 :string(255)
#  image_file_name       :string(255)
#  image_content_type    :string(255)
#  image_file_size       :integer(4)
#  image_updated_at      :datetime
#  circuitry             :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  comments_count        :integer(4)      default(0)
#  chain_gears_count     :integer(4)      default(0)
#  featured_at           :datetime
#  delta                 :boolean(1)      default(TRUE), not null
#  recommendations_count :integer(4)
#

class Preamp < Gear
  attr_accessible :circuitry

  define_index do
    indexes :make
    indexes :model

    has :updated_at, :created_at, :chain_gears_count, :featured_at, :recommendations_count
    set_property :delta => true
    set_property :enable_star => true
    set_property :min_prefix_len => 3
  end

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
