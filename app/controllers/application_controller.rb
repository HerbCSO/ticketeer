class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  around_filter :user_time_zone, if: :current_user

  MAILGUN_API_KEY = ENV['MAILGUN_API_KEY']
  MAILGUN_API_URL = "https://api:#{MAILGUN_API_KEY}@api.mailgun.net/v2/ticketeer.herokuapp.com"

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

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :name, :username, :email, :password, :password_confirmation, :time_zone)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :name, :username, :email, :password, :password_confirmation, :time_zone)
    end
  end

private

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

end
