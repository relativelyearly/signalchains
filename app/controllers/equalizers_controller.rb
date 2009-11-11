class EqualizersController < ResourceController::Base
  before_filter :load_chain

  index.before do
    @search = Equalizer.search({})
  end

  create.wants.html do
    if @chain
      redirect_to chain_equalizer_path(@chain, object)
    else
      redirect_to object
    end
  end

  def search
    @equalizers = Equalizer.search(:conditions => params["search"]).all

    respond_to do |format|
      format.html { render(:partial => 'equalizers/equalizer', :collection => @equalizers) }
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end