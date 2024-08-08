require 'grpc'
require_relative '../../lib/notification_services_pb'

class NotificationServiceImpl < Notification::NotificationService::Service
  def send_notification(request)
    notification_params = {
      action: request.action,
      user_id: request.user_id,
      user_email: request.user_email,
      task_id: request.task_id,
      task_title: request.task_title,
      task_description: request.task_description,  
    }

    notification = NotificationRepository.create(notification_params)

    if notification.persisted?
      Notification::NotificationResponse.new(success: true, message: 'Notification saved successfully')
    else
      Notification::NotificationResponse.new(success: false, message: 'Failed to save notification')
    end
  end
end

# Inicializa o servidor gRPC
def start_grpc_server
  server = GRPC::RpcServer.new
  server.add_http2_port('0.0.0.0:50052', :this_port_is_insecure)
  server.handle(NotificationServiceImpl)
  server.run_till_terminated
end