class NotificationRepository
  def self.create(params)
    Notification.create(params)
  end

  def self.all
    Notification.all
  end

  def self.find_by_id(id)
    Notification.find_by(id:)
  end
end