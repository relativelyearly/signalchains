class DynamicsProcessorsController < ResourceController::Base
  before_filter :load_chain

  index.before do
    @search = DynamicsProcessor.searchlogic({})
    @class = DynamicsProcessor
  end
  
  index.wants.html { render 'gear/index' }

  create.wants.html do
    if @chain
      redirect_to chain_dynamics_processor_path(@chain, object)
    else
      redirect_to object
    end
  end

  show.before do
    @class = DynamicsProcessor
  end

  show.wants.html { render 'gear/show' }

  def search
    @dynamics_processors = DynamicsProcessor.search(:conditions => params["search"]).all
    @class = DynamicsProcessor

    respond_to do |format|
      format.html { render(:partial => 'gear/index_gear', :collection => @dynamics_processors) }
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end