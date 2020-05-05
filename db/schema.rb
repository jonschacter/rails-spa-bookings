# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_05_202624) do

  create_table "appointments", force: :cascade do |t|
    t.integer "treatment_id", null: false
    t.integer "technician_id", null: false
    t.integer "user_id", null: false
    t.datetime "appointment_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["technician_id"], name: "index_appointments_on_technician_id"
    t.index ["treatment_id"], name: "index_appointments_on_treatment_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "spas", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "technicians", force: :cascade do |t|
    t.string "name"
    t.integer "spa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spa_id"], name: "index_technicians_on_spa_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.integer "spa_id", null: false
    t.string "name"
    t.text "description"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price", precision: 5, scale: 2
    t.index ["spa_id"], name: "index_treatments_on_spa_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["uid"], name: "index_users_on_uid"
  end

  add_foreign_key "appointments", "technicians"
  add_foreign_key "appointments", "treatments"
  add_foreign_key "appointments", "users"
  add_foreign_key "technicians", "spas"
  add_foreign_key "treatments", "spas"
end
