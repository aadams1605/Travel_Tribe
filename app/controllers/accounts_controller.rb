class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def show
    @user = current_user
  end

  private

  def set_user
    @user = current_user
  end
end
