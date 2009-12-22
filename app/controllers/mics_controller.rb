class MicsController < ResourceController::Base
  before_filter :load_chain
  before_filter :require_admin, :only => [:feature]

  index.before do
    @search = Mic.searchlogic({})
    @class = Mic
  end

  index.wants.html { render 'gear/index' }

  show.before do
    @class = Mic
  end

  show.wants.html { render 'gear/show' }

  create.wants.html do
    if @chain
      redirect_to chain_mic_path(@chain, object)
    else
      redirect_to object
    end
  end

  def search
    @mics = Mic.search(:conditions => params["search"]).all
    @class = Mic

    respond_to do |format|
      format.html { render(:partial => 'gear/index_gear', :collection => @mics) }
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