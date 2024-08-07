class NotificationService
  def self.create_notification(params)
    CreateNotification.call(params)
  end
end