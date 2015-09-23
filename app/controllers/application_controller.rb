class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :update_sanitized_params, if: :devise_controller?

  #  method to sanitized params for devise user sign up
  def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email,:password, :password_confirmation, :username, :gender, :phone_number, :description )}
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end
