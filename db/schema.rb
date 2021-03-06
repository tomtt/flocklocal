# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090620214153) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "excerpt"
    t.text     "description"
    t.integer  "owner_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.text     "location_description"
  end

  create_table "user_event_attendances", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
