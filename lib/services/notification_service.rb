module Services
class NotificationService
  extend Calleable
  def self.create_notification(params)
    Notifications::CreateNotification.call(params)
  end
end

end