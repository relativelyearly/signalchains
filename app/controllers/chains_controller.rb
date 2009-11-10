class ChainsController < ResourceController::Base
  before_filter :require_user, :only => [:new]

  create.after do
    object.user = current_user
    object.save
  end

  show.before do
    @gear = @chain.gear.sort {|x,y| x.position <=> y.position}
  end

  private
  def collection
    @collection ||= Chain.complete
  end
end