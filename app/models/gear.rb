class Gear < ActiveRecord::Base
  self.abstract_class = true

  attr_accessible :make, :model, :image

  has_many :chain_gears, :as => :gear
  has_many :chains, :through => :chain_gears, :order => 'likes_count DESC'
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :recommendations, :as => :recommendable, :dependent => :destroy

  has_attached_file :image,
                    :styles => { :micro => ["50x50#"], :thumb => ["100x100#", :jpg], :featured => ["445x150", :jpg], :display => ["370x500>"] },
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ':class/:id/:style.:extension'

    def to_param
      "#{self.id}-#{self.make.to_url}-#{self.model.to_url}"
    end

  def self.featured
    @featured ||= ThinkingSphinx.search('',
      :class => [Mic, Preamp, Equalizer, DynamicsProcessor, EffectsProcessor],
      :page => 1,
      :per_page => 1,
      :without => {:featured_at => 0},
      :order => 'featured_at DESC').first
  end

  def self.recommended
    @recommended ||= ThinkingSphinx.search('',
      :class => [Mic, Preamp, Equalizer, DynamicsProcessor, EffectsProcessor],
      :page => 1,
      :per_page => 5,
      :order => 'recommendations_count DESC').compact
    @recommended ||= []
  end

  def position
    2
  end

  def score
    90
  end

  def name
    "#{self.make} #{self.model}"
  end
end
