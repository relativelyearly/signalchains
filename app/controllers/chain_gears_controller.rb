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
end