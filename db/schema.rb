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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160214085946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string   "code"
    t.string   "city"
    t.string   "airport_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "flights", force: :cascade do |t|
    t.date     "departure_date"
    t.string   "carrier"
    t.integer  "flight_num"
    t.integer  "crs_dep_time"
    t.integer  "dep_time"
    t.integer  "delay"
    t.integer  "taxi_out"
    t.integer  "wheels_off"
    t.integer  "wheels_on"
    t.integer  "taxi_in"
    t.integer  "arr_time"
    t.integer  "arr_delay"
    t.boolean  "canceled"
    t.integer  "carrier_delay"
    t.integer  "weather_delay"
    t.integer  "security_delay"
    t.string   "org_location_name"
    t.string   "dest_location_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
