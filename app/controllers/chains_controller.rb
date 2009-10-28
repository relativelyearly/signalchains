class ChainsController < ResourceController::Base
  before_filter :require_user, :only => [:new]
end