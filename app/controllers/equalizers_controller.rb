class EqualizersController < ResourceController::Base
  before_filter :load_chain
  before_filter :require_admin, :only => [:feature]
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]

  index.before do
    @search = Equalizer.searchlogic({})
    @class = Equalizer
  end
  
  index.wants.html { render 'gear/index' }

  create.wants.html do
    if @chain
      redirect_to chain_equalizer_path(@chain, object)
    else
      redirect_to object
    end
  end

  show.before do
    @class = Equalizer
  end

  show.wants.html { render 'gear/show' }

  def search
    @equalizers = Equalizer.searchlogic(:conditions => params["search"]).all
    @class = Equalizer

    respond_to do |format|
      format.html { render(:partial => 'gear/index_gear', :collection => @equalizers) }
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