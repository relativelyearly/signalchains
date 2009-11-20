class EffectsProcessorsController < ResourceController::Base
  before_filter :load_chain

  index.before do
    @search = EffectsProcessor.search({})
    @class = EffectsProcessor
  end
  
  index.wants.html { render 'gear/index' }

  create.wants.html do
    if @chain
      redirect_to chain_effects_processor_path(@chain, object)
    else
      redirect_to object
    end
  end

  def search
    @effects_processors = EffectsProcessor.search(:conditions => params["search"]).all
    @class = EffectsProcessor

    respond_to do |format|
      format.html { render(:partial => 'gear/index_gear', :collection => @effects_processors) }
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end