# == Schema Information
#
# Table name: effects_processors
#
#  id                 :integer(4)      not null, primary key
#  make               :string(255)
#  model              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  effects_type       :string(255)
#  interface          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  comments_count     :integer(4)      default(0)
#  chain_gears_count  :integer(4)      default(0)
#  featured_at        :datetime
#

class EffectsProcessor < Gear
  attr_accessible :effects_type, :interface

  define_index do
    indexes :make
    indexes :model

    has :updated_at, :created_at, :chain_gears_count, :featured_at
    set_property :delta => true
    set_property :enable_star => true
    set_property :min_prefix_len => 3
  end

  def self.effects_types
    ['Reverb', 'Delay', 'Chorus', 'Multi', 'Other']
  end

  def self.index_partial
    'effects_processors/effects_processor'
  end

  def chain_gear_partial
    'effects_processors/effects_processor_info'
  end

  def self.interfaces
    ['Hardware', 'Software']
  end
end
