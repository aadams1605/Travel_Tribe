class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @requests = @user.requests
    @events = Event.where(id: @requests.pluck(:event_id).uniq)
  end

  private

  def set_user
    @user = current_user
  end
end
