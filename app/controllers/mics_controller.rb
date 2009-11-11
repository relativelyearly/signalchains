class MicsController < ResourceController::Base
  before_filter :load_chain

  index.before do
    @search = Mic.search({})
  end

  create.wants.html do
    if @chain
      redirect_to chain_mic_path(@chain, object)
    else
      redirect_to object
    end
  end

  def search
    @mics = Mic.search(:conditions => params["search"]).all

    respond_to do |format|
      format.html { render(:partial => 'mics/microphone', :collection => @mics) }
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end