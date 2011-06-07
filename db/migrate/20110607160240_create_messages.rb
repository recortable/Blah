class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :group
      t.belongs_to :user
      t.string :type
      t.string :format, :limit => 8
      t.string :title, :limit => 200
      t.string :ancestry
      t.text :body
      t.datetime :event_at

      t.timestamps
    end
    add_index :messages, :group_id
    add_index :messages, :user_id
    add_index :messages, :ancestry
  end
end
