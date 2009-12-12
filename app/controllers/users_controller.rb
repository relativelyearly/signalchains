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
      @events = @user.events_about_self.all(:include => [:actor, :secondary_subject, :subject])
    else
      redirect_to(new_user_session_path) and return unless current_user
      @user = current_user
      @events = @user.events
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