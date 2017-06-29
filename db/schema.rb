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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170629172853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.text     "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "device_id"
    t.string   "full_name"
    t.string   "phone"
    t.datetime "arranged_at"
    t.string   "aasm_state",         default: "created", null: false
    t.integer  "experts_service_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["device_id"], name: "index_appointments_on_device_id", using: :btree
    t.index ["experts_service_id"], name: "index_appointments_on_experts_service_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.text     "work_hours"
    t.string   "phone"
    t.string   "email"
    t.string   "site_url"
    t.string   "vk_url_1"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "instagram_url"
    t.string   "address"
    t.decimal  "latitude",      precision: 15, scale: 13
    t.decimal  "longitude",     precision: 15, scale: 13
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "vk_url_2"
    t.string   "vk_url_3"
    t.string   "vk_url_4"
  end

  create_table "devices", force: :cascade do |t|
    t.string   "fcm_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "email_addresses", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experts", force: :cascade do |t|
    t.string   "full_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "specialty"
    t.string   "experience"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "experts_services", force: :cascade do |t|
    t.integer "expert_id"
    t.integer "service_id"
    t.index ["expert_id"], name: "index_experts_services_on_expert_id", using: :btree
    t.index ["service_id"], name: "index_experts_services_on_service_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "sub_category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["sub_category_id"], name: "index_services_on_sub_category_id", using: :btree
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.integer  "role",                   default: 0
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "working_days", force: :cascade do |t|
    t.integer  "expert_id"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expert_id"], name: "index_working_days_on_expert_id", using: :btree
  end

end
