class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_params, only: [:show]

  def index
    @users = User.all
    if params[:query].present?
      sql_subquery = "username ILIKE :query OR location ILIKE :query"
      @users = @users.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
  end

  private

  def set_params
    @user = User.find(params[:id])
  end
end
