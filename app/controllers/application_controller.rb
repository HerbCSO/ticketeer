class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    flash[:error] = "Sorry, you're not an Admin user!"
    redirect_to root_path unless current_user.try(:is_admin?)
  end
end
