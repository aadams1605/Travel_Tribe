class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    query = params[:query]

    if query.present?
      @users = User.where("username LIKE ?", "%#{query}%")
    else
      @users = User.all
    end
  end

  def show
  end
end
