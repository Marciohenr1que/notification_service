class CreateUserNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :user_notifications do |t|
      t.string :action
      t.string :user_id
      t.string :user_email
      t.string :task_id
      t.string :task_title
      t.text :task_description

      t.timestamps
    end
  end
end
