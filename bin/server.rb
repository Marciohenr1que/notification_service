#!/usr/bin/env ruby

require_relative '../lib/notification_services_pb'
require 'grpc'

class NotificationService < Notification::NotificationService::Service
  def notify(request, _call)
    puts "Received message: #{request.message}"
    Notification::NotifyResponse.new(status: 'Message received')
  end
end

def main
  port = '0.0.0.0:50051'
  server = GRPC::RpcServer.new
  server.add_http2_port(port, :this_port_is_insecure)
  server.handle(NotificationService)
  puts "Server running on #{port}"
  server.run_till_terminated
end

main
