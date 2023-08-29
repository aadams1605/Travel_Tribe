class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, :set_event
  def show
    @user = current_user
  end

  private

  def set_user
    @user = current_user
  end

  def set_event
    @event = current_user.events
  end
end
