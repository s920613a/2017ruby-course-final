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

ActiveRecord::Schema.define(version: 20180110040053) do

  create_table "bikes", force: :cascade do |t|
    t.string "bikeType"
    t.integer "quantity"
    t.integer "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_bikes_on_supplier_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "cusName"
    t.string "cusID"
    t.string "cusTel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rents", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "bike_id"
    t.integer "price"
    t.datetime "backtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_rents_on_bike_id"
    t.index ["customer_id"], name: "index_rents_on_customer_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "supName"
    t.string "supTel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
