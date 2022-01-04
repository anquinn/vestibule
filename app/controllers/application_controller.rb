class ApplicationController < ActionController::Base
	include Pundit
	include SetLocale
	include Pagy::Backend
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	impersonates :user

  protected

  def configure_permitted_parameters
  	# devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :password, :password_confirmation, user_permission_ids:[]])
  end


	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
