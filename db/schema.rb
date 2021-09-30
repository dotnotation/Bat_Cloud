# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_30_211019) do

  create_table "bats", force: :cascade do |t|
    t.string "tag_number"
    t.string "nickname"
    t.string "species"
    t.datetime "date_found"
    t.string "location"
    t.datetime "date_last_seen"
    t.integer "weight"
    t.integer "age"
    t.string "sex"
    t.integer "wing_span"
    t.integer "colony_size"
    t.string "conservation_status"
    t.boolean "white_nose_syndrome"
    t.integer "discoverer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_bats_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.integer "bat_id_id", null: false
    t.integer "researcher_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bat_id_id"], name: "index_notes_on_bat_id_id"
    t.index ["researcher_id_id"], name: "index_notes_on_researcher_id_id"
  end

  create_table "researchers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "phone_number"
    t.integer "organization_id"
    t.string "uid"
    t.string "provider"
    t.string "access", default: "member"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_researchers_on_slug", unique: true
  end

  add_foreign_key "notes", "bat_ids"
  add_foreign_key "notes", "researcher_ids"
end
