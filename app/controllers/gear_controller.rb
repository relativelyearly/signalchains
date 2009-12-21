class GearController < ApplicationController
  def index
    @most_used = ThinkingSphinx.search '',
      :classes => [Mic, Preamp, Equalizer, DynamicsProcessor, EffectsProcessor],
      :page => 1,
      :per_page => 5,
      :order => 'chain_gears_count DESC'
    
    respond_to do |format|
      format.html {render 'gear/gear_index'}
    end
  end
end