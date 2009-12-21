# == Schema Information
#
# Table name: mics
#
#  id                 :integer         not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  mic_type           :string(255)
#  diaphragm_size     :string(255)
#  pattern            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer         default(0)
#  chain_gears_count  :integer         default(0)
#

class Mic < Gear
  attr_accessible :mic_type, :diaphragm_size, :pattern

  define_index do
    indexes :make
    indexes :model

    has :updated_at, :created_at
  end

  def self.types
    ['Condenser', 'Dynamic', 'Ribbon', 'PZM', 'Tube']
  end

  def self.diaphragm_sizes
    ['Small', 'Medium', 'Large']
  end

  def self.patterns
    ['Cardioid', 'Omni', 'Bi', 'Supercardioid', 'XY', 'ORTF', 'Spaced Pair', 'MS Stereo', 'Blumlein']
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
