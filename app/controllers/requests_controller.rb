class RequestsController < ApplicationController
  before_action :set_event, only: :create

  def create
    @request = Request.new
    @request.user = current_user
    @request.event = @event

    respond_to do |format|
      if @request.save
        format.html { redirect_to event_url(@event), notice: "request was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "request was unsuccessful." }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    @request = Request.find(params[:id])
    @request.status = "accepted"
    @request.save
    redirect_to dashboard_path
  end

  def reject
    @request = Request.find(params[:id])
    @request.status = "rejected"
    @request.save
    redirect_to dashboard_path
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
