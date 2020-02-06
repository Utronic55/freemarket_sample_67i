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

ActiveRecord::Schema.define(version: 2020_02_06_035703) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "item_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "brand_id", null: false
    t.integer "category_id", null: false
    t.integer "buyer_id", null: false
    t.integer "saler_id", null: false
    t.string "name", null: false
    t.integer "price", null: false
    t.text "text", limit: 4294967295, null: false
    t.string "size", null: false
    t.string "quality", null: false
    t.integer "deliverey_charge", null: false
    t.string "area", null: false
    t.string "delivery_method", null: false
    t.string "delivery_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
