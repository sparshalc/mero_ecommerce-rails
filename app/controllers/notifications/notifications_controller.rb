module Notifications
  class NotificationsController < Notifications::ApplicationController
    before_action :verify_admin
    def index
      @notifications = notifications.includes(:actor).order("id desc").page(params[:page])
      unread_ids = @notifications.reject(&:read?).select(&:id)
      Notification.read!(current_user, unread_ids)

      @notification_groups = @notifications.group_by { |note| note.created_at.to_date }
    end

    def read
      Notification.read!(current_user, params[:ids])
      render json: { ok: 1 }
    end

    def clean
      notifications.delete_all
      redirect_to notifications_path, alert: 'Deleted all Notifications'
    end

    private
      def notifications
        raise "You need reqiure user login for /notifications page." unless current_user
        Notification.where(user_id: current_user.id)
      end
      def verify_admin
        unless current_user.has_role? :admin
          redirect_to '/', alert:'Only admin can access this.'
        end
      end
  end
end
