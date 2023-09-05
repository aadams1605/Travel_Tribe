class NotificationsController < ApplicationController
  after_action :clear_notifications

  def index
  end

end
