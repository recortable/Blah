class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :resource, :polymorphic => true
      t.string :description, :limit => 16
      t.datetime :created_at
    end
    add_index :activities, :resource_id
    add_index :activities, :resource_type
  end
end
