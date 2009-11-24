class CommentsController < ResourceController::Base
  belongs_to :chain, :mic, :preamp, :dynamics_processor, :effects_processor, :equalizer

  create.after do
    object.user = current_user
    object.save
  end

  create.wants.html { redirect_to parent_object }
  update.wants.html { redirect_to parent_object }
end