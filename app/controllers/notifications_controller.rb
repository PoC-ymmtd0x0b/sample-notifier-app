class NotificationsController < ApplicationController
  before_action :set_my_notification, only: %i[show]

  # GET /notifications or /notifications.json
  def index
    @notifications = current_user.notifications.all
  end

  # GET /notifications/1 or /notifications/1.json
  def show
    redirect_to @notification.link
  end

  private

  def set_my_notification
    @notification = current_user.notifications.find(params[:id])
  end
end
