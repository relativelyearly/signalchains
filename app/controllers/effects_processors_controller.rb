class EffectsProcessorsController < ResourceController::Base
  before_filter :load_chain

  index.before do
    @search = EffectsProcessor.search({})
  end

  create.wants.html do
    if @chain
      redirect_to chain_effects_processor_path(@chain, object)
    else
      redirect_to object
    end
  end

  def search
    @effects_processors = EffectsProcessor.search(:conditions => params["search"]).all

    respond_to do |format|
      format.html { render(:partial => 'effects_processors/effects_processor', :collection => @effects_processors) }
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end