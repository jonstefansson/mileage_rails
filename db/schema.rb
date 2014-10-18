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

ActiveRecord::Schema.define(version: 20141016000500) do

  create_table "fillups", force: true do |t|
    t.integer  "odometer"
    t.date     "fill_date"
    t.decimal  "gallons",    precision: 5, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vehicle_id"
  end

  add_index "fillups", ["fill_date"], name: "index_fillups_on_fill_date"
  add_index "fillups", ["odometer", "vehicle_id"], name: "index_fillups_on_odometer_and_vehicle_id", unique: true
  add_index "fillups", ["vehicle_id"], name: "index_fillups_on_vehicle_id"

  create_table "vehicles", force: true do |t|
    t.string   "name"
    t.string   "index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
