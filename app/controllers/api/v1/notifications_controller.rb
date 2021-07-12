module Api
  module V1
    class NotificationsController < ApplicationController
      before_action :authenticate_request
      def index
        @notifications = current_user.notifications.recent
        render json: NotificationsRepresenter.new(@notifications).as_json
      end
      
      def create
        @notification = Notification.new(notification_params)
        if @notification.save
          render json: NotificationRepresenter.new(@notification).as_json, status: :created
        else
          render json: @notification.errors.full_messages, status: :unprocessable_entity
        end
      end

      def mark_as_read
        @notifications = current_user.notifications.unread
        @notifications.update_all(read_at: Time.zone.now)
        render json: {message: 'Notifications marked as read'}, status: :ok
      end

      private
        def notification_params
          params.require(:notification).permit(:content, :notifiable_type, :notifiable_id, :user_id)
        end
    end
  end
end