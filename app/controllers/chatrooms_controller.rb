class ChatroomsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @chatroom = @event.chatroom
    @message = Message.new(chatroom: @chatroom)
  end
end
