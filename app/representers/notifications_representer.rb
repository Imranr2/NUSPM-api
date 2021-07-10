class NotificationsRepresenter
    def initialize(notifications)
        @notifications = notifications
    end

    def as_json
        notifications.map do |notification|
            {
                id: notification.id,
                content: notification.content,
                user_id: notification.user_id,
                read_at: notification.read_at
            }
        end 
    end

    private
    
    attr_reader :notifications
end