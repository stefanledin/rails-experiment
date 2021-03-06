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

ActiveRecord::Schema.define(:version => 20130115203202) do

  create_table "presets", :force => true do |t|
    t.string   "label"
    t.string   "from"
    t.string   "fromtime"
    t.string   "to"
    t.string   "totime"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trips", :force => true do |t|
    t.integer  "user_id"
    t.datetime "datum"
    t.string   "avgangtabell"
    t.string   "avgangverklig"
    t.boolean  "avgangitid"
    t.string   "ankomsttabell"
    t.string   "ankomstverklig"
    t.boolean  "ankomstitid"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "fran"
    t.string   "till"
    t.integer  "diff1"
    t.integer  "diff2"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_id"
  end

end
