class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2

    auth_details = request.env["omniauth.auth"]
    if auth_details.info['email'].split("@")[1] == "andela.co"
      # do all the bits that come naturally in the callback controller
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    else
      # This is where we turn away the poor souls who do not match our domain
      render :text => "We're sorry, but only ANDELA registered emails are allowed"
    end
  end
end