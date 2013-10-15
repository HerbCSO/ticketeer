class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    raise SecurityError, "Sorry, you're not an admin user!" unless current_user.try(:is_admin?)
  end

  def format_ticket_number(number)
    if number && number.to_i
      "%03d" % (number % 1000)
    else
      "XXX"
    end
  end

  rescue_from SecurityError do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

end
