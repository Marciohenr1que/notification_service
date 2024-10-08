module Validatable
    extend ActiveSupport::Concern
  
    included do
      validates :action, :user_id, :user_email, :task_id, :task_title, :task_description, presence: true
    end
  end