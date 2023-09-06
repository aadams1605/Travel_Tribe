class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "messages/messages", locals: {message: @message})
      )
      @chatroom.participants.where.not(id: current_user.id).each do |user|
        notification_content = "You have a new message from #{current_user.username}"

        if @chatroom.event.present?
          notification_content += " in #{@chatroom.event.title}"
        end
          @notification = Notification.create(
          content: notification_content,
          user: user,
          notifiable_type: @message.class.name,
          notifiable_id: @message.id
        )
      end
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
