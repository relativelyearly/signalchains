class ChainsController < ResourceController::Base
  before_filter :require_user, :only => [:new, :like]

  create.after do
    object.user = current_user
    object.save
  end

  show.before do
    @input_source = @chain.input_source(:include => :chain)
    @gear = @chain.processors(:include => :chain).sort {|x,y| x.position <=> y.position}
    @chain.build_audio unless @chain.audio
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
  def collection
    @collection ||= Chain.complete
  end
end