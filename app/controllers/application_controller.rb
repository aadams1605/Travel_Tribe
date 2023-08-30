class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :description, :location, :gender, :age, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :description, :location, :gender, :age, :photo])
  end

  def search
    query = params[:query]
    @events_results = Event.where("title LIKE ? OR location LIKE ?", "%#{query}%", "%#{query}%") if query.present?
    @users_results = User.where("username LIKE ?", "%#{query}%") if query.present?
    if @users_results.present?
      redirect_to users_path(query: query)
    elsif @events_results.present?
      redirect_to events_path(query: query)
    else
      redirect_to events_path(query: query), alert: "No matches were found."
    end
  end
end
