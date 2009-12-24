class PreampsController < ResourceController::Base
  before_filter :load_chain
  before_filter :require_admin, :only => [:feature]
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]

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