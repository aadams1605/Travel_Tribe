class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new(chatroom: @chatroom)
    @event = @chatroom.event
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @user = User.find(params[:chatroom][:user_id])
    @chatroom = Chatroom.create(is_direct: true)
    ChatParticipant.create(user: @user, chatroom: @chatroom)
    ChatParticipant.create(user: current_user, chatroom: @chatroom)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      flash[:error] = 'Chatroom creation failed.'
      redirect_to root_path
    end
  end
end
