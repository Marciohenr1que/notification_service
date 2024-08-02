class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :task_id
      t.string :task_title
      t.text :task_description
      t.string :user_id
      t.string :user_email
      t.string :action

      t.timestamps
    end
  end
end
