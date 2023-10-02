class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :clear_notifications

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :description, :location, :gender, :age, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :description, :location, :gender, :age, :photo])
  end

  def clear_notifications
    previous_page = Rails.application.routes.recognize_path(request.referrer)
    return unless previous_page[:controller] == "notifications" && previous_page[:action] == "index"

    current_user.notifications.update_all(read: true)
  end
end
