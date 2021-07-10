class NotificationRepresenter
    def initialize(notification)
        @notification = notification
    end

    def as_json
      {
        id: notification.id,
        content: notification.content,
        user_id: notification.user_id,
        read_at: notification.read_at
      }
    end

    private
    
    attr_reader :notification
end