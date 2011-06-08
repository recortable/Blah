# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110608124245) do

  create_table "activities", :force => true do |t|
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "description",   :limit => 16
    t.datetime "created_at"
  end

  add_index "activities", ["resource_id"], :name => "index_activities_on_resource_id"
  add_index "activities", ["resource_type"], :name => "index_activities_on_resource_type"

  create_table "groups", :force => true do |t|
    t.string   "name",       :limit => 300
    t.string   "subdomain",  :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "rol",        :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["group_id"], :name => "index_memberships_on_group_id"
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "messages", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "type"
    t.string   "format",     :limit => 8
    t.string   "title",      :limit => 200
    t.string   "ancestry"
    t.text     "body"
    t.datetime "event_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["ancestry"], :name => "index_messages_on_ancestry"
  add_index "messages", ["group_id"], :name => "index_messages_on_group_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.boolean  "mailed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["message_id"], :name => "index_notifications_on_message_id"
  add_index "notifications", ["user_id"], :name => "index_notifications_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name",            :limit => 100
    t.string   "description",     :limit => 500
    t.string   "telephones",      :limit => 200
    t.datetime "last_login_at"
    t.integer  "login_count",                    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
