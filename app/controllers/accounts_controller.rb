class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @created_events = @user.events.order(created_at: :desc)
    @sent_requests = @user.requests.order(created_at: :desc)
    @received_requests = Request.where(event_id: @created_events.pluck(:id))

    @events = Event.where(id: @sent_requests.pluck(:event_id).uniq)
  end

  private

  def set_user
    @user = current_user
  end
end
