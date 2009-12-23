class HomeController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @events = @user.events
      render 'users/show' and return
    else
      @new_chains = Chain.complete(:order => 'created_at DESC', :limit => 5)
      @new_users = User.all(:order => 'created_at DESC', :limit => 5)
    end
  end
end
