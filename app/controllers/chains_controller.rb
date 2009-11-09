class ChainsController < ResourceController::Base
  before_filter :require_user, :only => [:new]

  create.after do
    object.user = current_user
    object.save
  end
end