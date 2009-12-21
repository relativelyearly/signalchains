# == Schema Information
#
# Table name: equalizers
#
#  id                 :integer         not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  equalizer_type     :string(255)
#  bands              :integer
#  interface          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer         default(0)
#  chain_gears_count  :integer         default(0)
#

class Equalizer < Gear
  attr_accessible :bands, :interface, :equalizer_type

  define_index do
    indexes :make
    indexes :model

    has :updated_at, :created_at
  end

  def self.equalizer_types
    ['Parametric', 'Graphic']
  end

  def self.interfaces
    ['Hardware', 'Software']
  end

  def self.index_partial
    'equalizers/equalizer'
  end

  def chain_gear_partial
    'equalizers/equalizer_info'
  end
end
