class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    if request.env['omniauth.auth'].extra.raw_info.email !~ /(@opower.com|@dreesbach.org)\Z/
      flash[:error] = "Sorry, you're not allowed to sign into this application."
      redirect_to root_path
    else
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        flash[:error] = "Sorry, we encountered a problem and could not log you in."
        logger.error "Error when trying to create user #{@user.email}: #{@user.errors.messages}"
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to root_path
      end
    end
  end
end
