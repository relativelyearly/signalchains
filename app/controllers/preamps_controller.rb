class PreampsController < ResourceController::Base
  before_filter :load_chain

  index.before do
    @search = Preamp.searchlogic({})
    @class = Preamp
  end
  
  index.wants.html { render 'gear/index' }

  create.wants.html do
    if @chain
      redirect_to chain_preamp_path(@chain, object)
    else
      redirect_to object
    end
  end

  show.before do
    @class = Preamp
  end

  show.wants.html { render 'gear/show' }

  def search
    @preamps = Preamp.search(:conditions => params["search"]).all
    @class = Preamp

    respond_to do |format|
      format.html { render(:partial => 'gear/index_gear', :collection => @preamps) }
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end