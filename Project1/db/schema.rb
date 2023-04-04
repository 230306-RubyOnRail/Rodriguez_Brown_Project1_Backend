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

ActiveRecord::Schema[7.0].define(version: 2023_03_30_215119) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reimbursements", force: :cascade do |t|
    t.integer "amount", null: false
    t.string "description", null: false
    t.integer "status", default: 1
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reimbursements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 16, null: false
    t.string "password_digest", null: false
    t.boolean "admin", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reimbursements", "users"
end
