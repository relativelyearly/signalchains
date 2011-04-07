class ChainsController < ResourceController::Base
  before_filter :require_user, :only => [:new, :like, :create, :edit, :update, :destroy]
  before_filter :require_admin, :only => [:feature]

  index.before {@tags = Chain.tag_counts_on(:tags)}

  create.before do
    object.user = current_user
    object
  end

  show.before do
    if object
      @input_source = object.input_source(:include => :chain)
      @preamp = object.preamp(:include => :chain)
      @gear = object.processors(:include => :chain).sort {|x,y| x.position <=> y.position}
      object.build_audio unless object.audio
    end
  end

  show.wants.html do
    if object
      render(:action => :show)
    else
      render(:file => "public/404.html", :layout => false, :status => 404)
    end
  end

  update.failure.wants.html do
    if params[:chain][:title] || params[:chain][:year] || params[:chain][:file_attributes]
      @input_source = @chain.input_source(:include => :chain)
      @preamp = @chain.preamp(:include => :chain)
      @gear = @chain.processors(:include => :chain).sort {|x,y| x.position <=> y.position}
      @chain.build_audio unless @chain.audio
      render :show
    end
  end

  def like
    if current_user.likes?(object)
      Like.find(:first, :conditions => {:user_id => current_user.id, :chain_id => object.id}).destroy
    else
      Like.create(:user_id => current_user.id, :chain_id => object.id)
    end

    respond_to do |format|
      format.html { redirect_to(chain_path(object)) }
    end
  end

  def feature
    @chain = object
    @chain.update_attribute(:featured_at, DateTime.now)

    respond_to do |format|
      format.html { redirect_to(chain_path(@chain)) }
    end
  end

  private
  def object
    return @object if @object
    chain = Chain.find(params[:id])

    if (chain && chain.complete?) || (current_user && chain.user == current_user)
      @object = chain
    end

    @object
  end

  def collection
    return @collection if @collection
    if params[:user_id]
      @user = User.find(params[:user_id])
    elsif params[:username]
      @user = User.find_by_login(params[:username])
    end
    if @user
      @collection = @user.chains.paginate(:include => [:user], :order => 'created_at DESC', :page => params[:page], :per_page => 10) if current_user == @user
      @collection = @user.chains.complete.paginate(:include => [:user], :order => 'created_at DESC', :page => params[:page], :per_page => 10) unless current_user == @user
    else
      @collection = Chain.complete.paginate(:page => params[:page], :per_page => 10)
    end

    @collection
  end
end