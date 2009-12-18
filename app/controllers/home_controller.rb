class HomeController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @events = @user.events
      render 'users/show' and return
    end
  end
end
