# == Schema Information
# Schema version: 20100127165047
#
# Table name: mics
#
#  id                    :integer(4)      not null, primary key
#  make                  :string(255)
#  model                 :string(255)
#  image_file_name       :string(255)
#  image_content_type    :string(255)
#  image_file_size       :integer(4)
#  image_updated_at      :datetime
#  mic_type              :string(255)
#  diaphragm_size        :string(255)
#  pattern               :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  comments_count        :integer(4)      default(0)
#  chain_gears_count     :integer(4)      default(0)
#  featured_at           :datetime
#  delta                 :boolean(1)      default(TRUE), not null
#  recommendations_count :integer(4)
#

class Mic < Gear
  attr_accessible :mic_type, :diaphragm_size, :pattern

  define_index do
    indexes :make
    indexes :model

    has :updated_at, :created_at, :chain_gears_count, :featured_at, :recommendations_count
    set_property :delta => true
    set_property :enable_star => true
    set_property :min_prefix_len => 3
  end

  def self.types
    ['Condenser', 'Dynamic', 'Ribbon', 'PZM', 'Tube']
  end

  def self.diaphragm_sizes
    ['Small', 'Medium', 'Large']
  end

  def self.patterns
    ['Cardioid', 'Omni', 'Bidirectional', 'Supercardioid', 'XY', 'ORTF', 'Spaced Pair', 'MS Stereo', 'Blumlein', 'Multi']
  end

  def self.index_partial
    'mics/microphone'
  end

  def chain_gear_partial
    'mics/mic'
  end

  def input_source?
    true
  end

  def position
    0
  end
end
