class NotificationsController < ApplicationController
    # POST /notifications
    def create
      notification_params = params.permit(:task_id, :task_title, :task_description, :user_id, :user_email, :action)
      
      notification = NotificationRepository.create(notification_params)
  
      if notification.persisted?
        render json: { success: true, message: 'Notification received and saved' }, status: :created
      else
        render json: { success: false, message: 'Failed to save notification' }, status: :unprocessable_entity
      end
    end
  end