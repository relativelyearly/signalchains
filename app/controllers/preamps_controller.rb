class PreampsController < ResourceController::Base
  before_filter :load_chain

  index.before do
    @search = Preamp.search({})
  end

  create.wants.html do
    if @chain
      redirect_to chain_preamp_path(@chain, object)
    else
      redirect_to object
    end
  end

  def search
    @preamps = Preamp.search(:conditions => params["search"]).all

    respond_to do |format|
      format.html { render(:partial => 'preamps/preamp', :collection => @preamps) }
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end