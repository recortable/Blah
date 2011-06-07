class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, :limit => 300
      t.string :subdomain, :limit => 100
      t.timestamps
    end
  end
end
