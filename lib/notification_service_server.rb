require 'grpc'
require_relative '../lib/notification_services_pb'
require_relative '../config/environment'

class NotificationServiceServer < Notification::NotificationService::Service
  def send_notification(notification_request, _unused_call)
    puts "Received notification request: #{notification_request.inspect}"
    create_notification(notification_request)
  end
  def send_webscraping_notification(webscraping_notification_request, _unused_call)
    puts "Received webscraping notification request: #{webscraping_notification_request.inspect}"
    
    Notification::NotificationResponse.new(success: true, message: 'Webscraping notification received')
  end
  private

  def create_notification(notification_request)
    begin
      UserNotification.create!(
        action: notification_request.action,
        user_id: notification_request.user_id,
        user_email: notification_request.user_email,
        task_id: notification_request.task_id,
        task_title: notification_request.task_title,
        task_description: notification_request.task_description
      )
      puts "Notification created successfully."
      Notification::NotificationResponse.new(success: true, message: 'Notification received')
    rescue => e
      puts "Failed to create notification: #{e.message}"
      Notification::NotificationResponse.new(success: false, message: e.message)
    end
  end
end

def start_server
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50052', :this_port_is_insecure)
  s.handle(NotificationServiceServer)
  puts "Server is listening on port 50052"
  s.run_till_terminated
end

start_server

start_server


