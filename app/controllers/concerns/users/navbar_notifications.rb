module Users
  module NavbarNotifications
    extend ActiveSupport::Concern

    included do
      before_action :set_notifications, if: :user_signed_in?
    end

    def set_notifications
      # Counts to send to native apps
      @account_unread = current_user.notifications.unread.count
      @total_unread = current_user.notifications.unread.count
    end
  end
end