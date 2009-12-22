class Admin::AdsController < ResourceController::Base
  before_filter :require_admin
end