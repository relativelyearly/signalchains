class Search
  attr_accessor :keyword, :page

  def initialize(params={})
    params ||= {}
    params.each do |key, value|
      self.send("#{key}=", value)
    end
  end
  
  def to_param
    keyword
  end

  def id
    nil
  end

  def new_record?
    true
  end

  def chains(per_page=10)
    Chain.complete.search(self.keyword, :page => self.page, :per_page => per_page,
      :order => 'likes_count DESC', :star => true)
  end
  
  def users(per_page=10)
    User.search(self.keyword, :page => self.page, :per_page => per_page, :order => :login, :star => true)
  end

  def gear(per_page=10)
    ThinkingSphinx.search self.keyword,
      :classes => [Mic, Preamp, Equalizer, DynamicsProcessor, EffectsProcessor],
      :page => self.page,
      :per_page => per_page, 
      :order => :created_at,
      :star => true
  end

  def errors
    @errors ||= ActiveRecord::Errors.new(self)
    @errors
  end
end