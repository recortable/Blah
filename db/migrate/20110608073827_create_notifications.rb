class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.belongs_to :message
      t.boolean :mailed, :default => false
      t.timestamps
    end
    add_index :notifications, :user_id
    add_index :notifications, :message_id
  end
end
