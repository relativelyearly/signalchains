class SitemapsController < ApplicationController
  def show
    @users = User.all(:select => 'id,login,updated_at')
    @chains = Chain.complete.all(:select => 'id,name,updated_at')

    @mics = Mic.all(:select => 'id,make,model,updated_at')
    @preamps = Preamp.all(:select => 'id,make,model,updated_at')
    @dynamics_processors = DynamicsProcessor.all(:select => 'id,make,model,updated_at')
    @effects_processors = EffectsProcessor.all(:select => 'id,make,model,updated_at')
    @equalizers = Equalizer.all(:select => 'id,make,model,updated_at')
    @converters = Converter.all(:select => 'id,make,model,updated_at')
  end
end