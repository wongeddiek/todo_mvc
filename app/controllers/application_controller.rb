class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # configure redirect after user signs in
  def after_sign_in_path_for(user)
    root_path
  end

  protected
  def require_login
    unless user_signed_in?
      redirect_to new_user_session_path, notice: "You must be signed in!"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname])
  end

end
