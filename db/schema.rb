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

ActiveRecord::Schema.define(:version => 20101205093053) do

  create_table "candidates", :force => true do |t|
    t.integer  "citizen_id"
    t.integer  "constituency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "citizens", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.text     "bio"
    t.string   "street"
    t.string   "postal"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_2"
    t.integer  "region_id"
    t.integer  "country_id"
  end

  add_index "citizens", ["login"], :name => "index_citizens_on_login", :unique => true

  create_table "constituencies", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "counties", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string  "iso"
    t.string  "name"
    t.string  "printable_name"
    t.string  "iso3"
    t.integer "numcode"
  end

  create_table "issues", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "constituency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "citizen_id"
    t.integer  "constituency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.string   "name"
  end

  create_table "statements", :force => true do |t|
    t.text     "body"
    t.string   "target_type"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.boolean  "yea"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "citizen_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
