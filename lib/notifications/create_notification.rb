module Notifications
class CreateNotification
  extend Calleable
    def initialize(params)
      @params = params
    end
  
    def call
      begin
        UserNotification.create!(
          action: @params[:action],
          user_id: @params[:user_id],
          user_email: @params[:user_email],
          task_id: @params[:task_id],
          task_title: @params[:task_title],
          task_description: @params[:task_description]
        )
        { success: true, message: 'Notification received' }
      rescue => e
        { success: false, message: e.message }
      end
    end
  end
end