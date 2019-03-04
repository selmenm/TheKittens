class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:pseudo, :password, :remember_me)}
		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :username, :age, :email, :password, :password_confirmation)}
  end
end
