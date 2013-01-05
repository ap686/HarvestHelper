# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121231173048) do

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "device_schedules", :force => true do |t|
    t.string   "sensor_flag"
    t.integer  "frequency"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "f_monday"
    t.boolean  "f_tuesday"
    t.boolean  "f_wednesday"
    t.boolean  "f_thursday"
    t.boolean  "f_friday"
    t.boolean  "f_saturday"
    t.boolean  "f_sunday"
    t.integer  "garden_device_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "garden_data", :force => true do |t|
    t.integer  "garden_device_id"
    t.decimal  "temperature"
    t.decimal  "humidity"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.decimal  "lux"
  end

  create_table "garden_devices", :force => true do |t|
    t.string   "serial_number"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "garden_devices", ["serial_number"], :name => "index_garden_devices_on_serial_number", :unique => true

  create_table "message_boards", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "message_board_id"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "schedule_type_lookups", :force => true do |t|
    t.string   "flag"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "schedule_type_lookups", ["flag"], :name => "index_schedule_type_lookups_on_flag", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
