class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
    session[:return_to] = params[:return_to] if params[:return_to]
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      @user_session.user.tender_multipass(cookies, 1.week.from_now)
      flash[:notice] = "Login successful!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    current_user.tender_expire(cookies) if current_user
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end