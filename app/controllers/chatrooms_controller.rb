class ChatroomsController < ApplicationController
  def index
    @direct_chatrooms = current_user.chatrooms
    @owned_events = current_user.events
    @attended_events = Event.joins(:requests).where(requests: { status: "accepted", user: current_user })
    @all_chatrooms = (@direct_chatrooms + @owned_events.map(&:chatroom) + @attended_events.map(&:chatroom)).uniq
  end

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
