class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
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
    @user = User.find(params[:id]) if params[:id]
    @user ||= @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
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
      format.html {redirect_to @user}
    end
  end
end