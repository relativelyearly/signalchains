class ChainGearsController < ResourceController::Base
  update.wants.html { redirect_to object.chain }
  
  def add_mic
    @chain = Chain.find(params[:chain_id])
    @mic = Mic.find(params[:mic_id])
    @chain_gear = ChainGear.new

    @chain_gear.chain = @chain
    @chain_gear.gear = @mic

    if @chain_gear.save
      redirect_to chain_path(@chain)
    else
      redirect_to chain_mic_path(@chain, @mic)
    end
  end

  def add_line_in
    @chain = Chain.find(params[:chain_id])
    @chain_gear = ChainGear.new

    @chain_gear.chain = @chain
    @chain_gear.gear = nil
    @chain_gear.save

    redirect_to chain_path(@chain)
  end

  def add_preamp
    @chain = Chain.find(params[:chain_id])
    @preamp = Preamp.find(params[:preamp_id])
    @chain_gear = ChainGear.new

    @chain_gear.chain = @chain
    @chain_gear.gear = @preamp

    if @chain_gear.save
      redirect_to chain_path(@chain)
    else
      redirect_to chain_preamp_path(@chain, @preamp)
    end
  end

  def add_dynamics_processor
    @chain = Chain.find(params[:chain_id])
    @dynamics_processor = DynamicsProcessor.find(params[:dynamics_processor_id])
    @chain_gear = ChainGear.new

    @chain_gear.chain = @chain
    @chain_gear.gear = @dynamics_processor

    if @chain_gear.save
      redirect_to chain_path(@chain)
    else
      redirect_to chain_dynamics_processor_path(@chain, @dynamics_processor)
    end
  end

  def add_effects_processor
    @chain = Chain.find(params[:chain_id])
    @effects_processor = EffectsProcessor.find(params[:effects_processor_id])
    @chain_gear = ChainGear.new

    @chain_gear.chain = @chain
    @chain_gear.gear = @effects_processor

    if @chain_gear.save
      redirect_to chain_path(@chain)
    else
      redirect_to chain_effects_processor_path(@chain, @effects_processor)
    end
  end

  def add_equalizer
    @chain = Chain.find(params[:chain_id])
    @equalizer = Equalizer.find(params[:equalizer_id])
    @chain_gear = ChainGear.new

    @chain_gear.chain = @chain
    @chain_gear.gear = @equalizer

    if @chain_gear.save
      redirect_to chain_path(@chain)
    else
      redirect_to chain_equalizer_path(@chain, @equalizer)
    end
  end
end