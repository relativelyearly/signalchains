class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:edit, :update, :follow]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def show
    if params[:id]
      @user = User.find_by_login(params[:id])
      render(:file => "public/404.html", :layout => false, :status => 404) and return unless @user
      @events = @user.events_about_self.paginate(:include => [:actor, :secondary_subject, :subject], :per_page => 10, :page => params[:page])
    else
      redirect_to(new_user_session_path) and return unless current_user
      @user = current_user
      @events = @user.events.paginate(:include => [:actor, :secondary_subject, :subject], :per_page => 20, :page => params[:page])
      @recommended_chains = Chain.complete.find(:all, :order => 'likes_count DESC', :limit => 5)
    end

    if @user == current_user
      @chains = @user.chains.all(:limit => 5, :order => 'created_at DESC')
    else
      @chains = @user.chains.complete.all(:limit => 5, :order => 'created_at DESC')
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated successfully"
      redirect_to edit_account_path
    else
      render :action => :edit
    end
  end

  def follow
    @user = User.find(params[:id])

    if current_user.follows?(@user)
      Follow.find(:first, :conditions => {:user_id => current_user.id, :followed_id => @user.id}).destroy
    else
      Follow.create(:user_id => current_user.id, :followed_id => @user.id)
    end

    respond_to do |format|
      format.html {redirect_to user_by_login_path(:id => @user.login)}
    end
  end
end