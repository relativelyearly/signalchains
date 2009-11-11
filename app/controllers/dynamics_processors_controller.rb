class DynamicsProcessorsController < ResourceController::Base
  before_filter :load_chain

  index.before do
    @search = DynamicsProcessor.search({})
  end

  create.wants.html do
    if @chain
      redirect_to chain_dynamics_processor_path(@chain, object)
    else
      redirect_to object
    end
  end

  def search
    @dynamics_processors = DynamicsProcessor.search(:conditions => params["search"]).all

    respond_to do |format|
      format.html { render(:partial => 'dynamics_processors/dynamics_processor', :collection => @dynamics_processors) }
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end