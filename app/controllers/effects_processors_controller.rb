class EffectsProcessorsController < ResourceController::Base
  before_filter :load_chain
  before_filter :require_admin, :only => [:feature]

  index.before do
    @search = EffectsProcessor.searchlogic({})
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

  show.before do
    @class = EffectsProcessor
  end

  show.wants.html { render 'gear/show' }

  def search
    @effects_processors = EffectsProcessor.search(:conditions => params["search"]).all
    @class = EffectsProcessor

    respond_to do |format|
      format.html { render(:partial => 'gear/index_gear', :collection => @effects_processors) }
    end
  end

  def feature
    @gear = object
    @gear.update_attribute(:featured_at, DateTime.now)

    respond_to do |format|
      format.html { redirect_to(@gear) }
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end