class PreampsController < ResourceController::Base
  before_filter :load_chain
  before_filter :require_admin, :only => [:feature]
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy, :recommend]

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
    @preamps = Preamp.searchlogic(:conditions => params["search"]).all
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

  def recommend
    @gear = object
    if current_user.recommends?(@gear)
      current_user.recommendations.find(:first, :conditions => {:recommendable_id => @gear.id, :recommendable_type => @gear.class.to_s}).destroy
    else
      Recommendation.create(:user_id => current_user.id, :recommendable_id => @gear.id, :recommendable_type => @gear.class.to_s)
    end

    respond_to do |format|
      format.html { redirect_to(@gear) }
    end
  end

  private
  def load_chain
    @chain ||= Chain.find(params[:chain_id]) if params[:chain_id]
  end
end