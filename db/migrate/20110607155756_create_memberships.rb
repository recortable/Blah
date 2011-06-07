class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :user
      t.belongs_to :group
      t.string :rol, :limit => 8

      t.timestamps
    end
    add_index :memberships, :user_id
    add_index :memberships, :group_id
  end
end
