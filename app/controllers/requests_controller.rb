class RequestsController < ApplicationController
  before_action :set_event, only: :create

  def create
    @request = Request.new
    @request.user = current_user
    @request.event = @event

    if @request.save
      @notification = Notification.create(
        content: "New request to join your event #{@event.title}",
        user: @event.user,
        notifiable_type: @event.class.name,
        notifiable_id: @event.id
      )
      redirect_to event_url(@event), notice: "Request to join event was sent!"
    else
      redirect_to event_path(@event)
    end
      flash[:notice] = @request.errors.full_messages.first unless @request.valid?
  end

  def accept
    @request = Request.find(params[:id])
    @request.status = "accepted"
    @request.save
    @notification = Notification.create(
      content: "Your request to join the event: #{@request.event.title} has been Accepted",
      user: @request.user,
      notifiable_type: @request.event.class.name,
      notifiable_id: @request.event.id
    )
    redirect_to dashboard_path
  end

  def reject
    @request = Request.find(params[:id])
    @request.status = "rejected"
    @request.save
    @notification = Notification.create(
      content: "Your request to join the event: #{@request.event.title} has been Rejected",
      user: @request.user,
      notifiable_type: @request.event.class.name,
      notifiable_id: @request.event.id
    )
    redirect_to dashboard_path
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
