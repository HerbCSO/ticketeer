class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    raise SecurityError "Sorry, you're not an admin user!" unless current_user.try(:is_admin?)
  end

  rescue_from SecurityError do |exception|
    flash[:error] = exception.msg
    redirect_to root_url
  end

end
