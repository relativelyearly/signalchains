class HomeController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @events = @user.events.paginate(:include => [:actor, :secondary_subject, :subject], :per_page => 15, :page => params[:page])
      @chains = @user.chains.all(:limit => 5, :order => 'created_at DESC')
      render 'users/show' and return
    else
      @new_chains = Chain.complete.find(:all, :order => 'created_at DESC', :limit => 5)
      @new_users = User.all(:order => 'created_at DESC', :limit => 5)
    end
  end

  def show
    @new_chains = Chain.complete.find(:all, :order => 'created_at DESC', :limit => 5)
    @new_users = User.all(:order => 'created_at DESC', :limit => 5)

    render :action => 'index'
  end
end
