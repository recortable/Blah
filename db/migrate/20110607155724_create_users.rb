class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name, :limit => 100
      t.string :description, :limit => 500
      t.string :telephones, :limit => 200
      t.datetime :last_login_at
      t.integer :login_count, :default => 0
      t.timestamps
    end
  end
end
