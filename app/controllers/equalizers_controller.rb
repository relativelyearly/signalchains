class EqualizersController < ResourceController::Base
  before_filter :load_chain

  create.wants.html do
    if @chain
      redirect_to chain_equalizer_path(@chain, object)
    else
      redirect_to object
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end