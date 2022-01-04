class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # skip_before_action :authenticate_user!

  # def google_oauth2
  #   auth = request.env["omniauth.auth"]
  #   user = User.where(provider: auth["provider"], uid: auth["uid"])
  #           .first_or_initialize(email: auth["info"]["email"])
  #   user.name ||= auth["info"]["name"]
  #   user.save!

  #   user.remember_me = true
  #   sign_in(:user, user)

  #   redirect_to after_sign_in_path_for(user)
  # end

  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.present? && @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
        redirect_to new_user_session_url, alert: "Unable to find user."
      end
  end
end