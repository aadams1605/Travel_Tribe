class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_params, only: [:show]
  before_action :find_existing_chatroom, only: [:show]

  def index
    @users = User.all
    if params[:query].present?
      sql_subquery = "username ILIKE :query OR location ILIKE :query"
      @users = @users.where(sql_subquery, query: "%#{params[:query]}%")
    end

    @no_results = @users.empty?
  end

  def show
  end

  private

  def set_params
    @user = User.find(params[:id])
  end

  def find_existing_chatroom
    @existing_chatroom = Chatroom.where(is_direct: true).find do |chatroom|
      chatroom.chat_participants.exists?(user_id: @user.id) &&
        chatroom.chat_participants.exists?(user_id: current_user.id)
    end
  end
end
