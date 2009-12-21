# == Schema Information
#
# Table name: dynamics_processors
#
#  id                 :integer(4)      not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  circuitry          :string(255)
#  compression_type   :string(255)
#  dynamics_type      :string(255)
#  interface          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer(4)      default(0)
#  chain_gears_count  :integer(4)      default(0)
#  featured_at        :datetime
#

class DynamicsProcessor < Gear
  attr_accessible :circuitry, :compression_type, :dynamics_type, :interface

  define_index do
    indexes :make
    indexes :model

    has :updated_at, :created_at, :chain_gears_count, :featured_at
  end

  def self.dynamics_types
    ['Compressor', 'Limiter', 'Expander', 'DeEsser']
  end

  def self.circuitries
    ['Solid State', 'Tube']
  end

  def self.compression_types
    ['FET', 'RMS', 'Optical']
  end

  def self.interfaces
    ['Hardware', 'Software']
  end

  def self.index_partial
    'dynamics_processors/dynamics_processor'
  end

  def chain_gear_partial
    'dynamics_processors/dynamics_processor_info'
  end
end
