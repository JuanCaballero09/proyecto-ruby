class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre,:apellido,:telefono, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :apellido, :telefono, :password, :password_confirmation, :current_password])
  end

  def after_sign_in_path_for(resource)
    home_path
  end
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
