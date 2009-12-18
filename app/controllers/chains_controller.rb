class ChainsController < ResourceController::Base
  before_filter :require_user, :only => [:new, :like]

  create.after do
    object.user = current_user
    object.save
  end

  show.before do
    @input_source = @chain.input_source(:include => :chain)
    @preamp = @chain.preamp(:include => :chain)
    @gear = @chain.processors(:include => :chain).sort {|x,y| x.position <=> y.position}
    @chain.build_audio unless @chain.audio
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

  private
  def object
    chain = Chain.find(params[:id]) if params[:id]
    @object ||= Chain.new unless chain
    @object ||= Chain.complete.find(params[:id]) if chain && chain.complete?
    @object ||= current_user.chains.find(params[:id])
    @object
  end

  def collection
    @collection ||= Chain.complete
  end
end