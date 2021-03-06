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

ActiveRecord::Schema.define(:version => 20130819192948) do

  create_table "discussions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "owner_id"
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "stages", :force => true do |t|
    t.integer  "project_id"
    t.datetime "deadline"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subtasks", :force => true do |t|
    t.string   "title"
    t.boolean  "active",     :default => true
    t.integer  "task_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "project_id"
    t.integer  "owner_id"
    t.integer  "performer_id", :limit => 255
    t.string   "title"
    t.text     "content"
    t.boolean  "active",                      :default => true
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "stage_id",                    :default => 0
    t.date     "deadline"
    t.integer  "status",       :limit => 255, :default => 0
    t.integer  "group_id",                    :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password_digest"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "name"
    t.boolean  "superuser",       :default => true
  end

end
