class CommentsController < ResourceController::Base
  belongs_to :chain, :mic, :preamp, :dynamics_processor, :effects_processor, :equalizer, :blog_post
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]

  create.before do
    object.user = current_user
  end

  create.wants.html { redirect_to parent_object }
  update.wants.html { redirect_to parent_object }
  destroy.wants.html { redirect_to parent_object }
end
