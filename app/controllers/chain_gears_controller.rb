class ChainGearsController < ResourceController::Base
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
end