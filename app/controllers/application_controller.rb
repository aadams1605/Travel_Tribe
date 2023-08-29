class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :description, :location, :gender, :age, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :description, :location, :gender, :age, :photo])
  end
end
