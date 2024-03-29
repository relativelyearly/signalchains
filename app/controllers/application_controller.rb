class ApplicationController < ActionController::Base
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user, :logged_in?

  helper :all

  def logged_in?
    !current_user_session.nil?
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
      return false
    end
  end

  def require_admin
    unless current_user && current_user.admin?
      render :file => "public/404.html", :layout => false, :status => 404
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      session[:return_to] = params[:return_to] if params[:return_to]
      current_user.tender_multipass(cookies, 1.week.from_now)
      flash[:notice] = "You must be logged out to access this page"
      redirect_back_or_default account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end