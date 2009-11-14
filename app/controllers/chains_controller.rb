class ChainsController < ResourceController::Base
  before_filter :require_user, :only => [:new]

  create.after do
    object.user = current_user
    object.save
  end

  show.before do
    @input_source = @chain.input_source
    @gear = @chain.processors.sort {|x,y| x.position <=> y.position}
    @chain.build_audio unless @chain.audio
  end

  private
  def collection
    @collection ||= Chain.complete
  end
end