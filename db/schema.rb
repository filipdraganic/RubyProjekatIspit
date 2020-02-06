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

ActiveRecord::Schema.define(version: 2020_02_06_012900) do

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "post_id"
  end

  create_table "dokuments", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dokuments_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "dokument_id", null: false
    t.index ["dokument_id", "user_id"], name: "index_dokuments_users_on_dokument_id_and_user_id", unique: true
    t.index ["user_id", "dokument_id"], name: "index_dokuments_users_on_user_id_and_dokument_id"
  end

  create_table "izmenas", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "dokument_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["dokument_id"], name: "index_izmenas_on_dokument_id"
  end

  create_table "organizacijas", force: :cascade do |t|
    t.string "ime"
    t.string "opisKompanije"
    t.integer "brojClanova"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "primedbas", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "dokument_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dokument_id"], name: "index_primedbas_on_dokument_id"
    t.index ["user_id"], name: "index_primedbas_on_user_id"
  end

  create_table "tranzakcijas", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "dokument_id", null: false
    t.integer "cena"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dokument_id"], name: "index_tranzakcijas_on_dokument_id"
    t.index ["user_id"], name: "index_tranzakcijas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "izmenas", "dokuments"
  add_foreign_key "posts", "users"
  add_foreign_key "primedbas", "dokument_ids", column: "dokument_id"
  add_foreign_key "primedbas", "user_ids", column: "user_id"
  add_foreign_key "tranzakcijas", "dokument_ids", column: "dokument_id"
  add_foreign_key "tranzakcijas", "user_ids", column: "user_id"
end
