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

ActiveRecord::Schema.define(version: 2023_03_27_082104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "users", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id"], name: "index_users_on_country_id"
  end

  create_table "users_1", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('users_id_seq'::regclass)" }, null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id", "score"], name: "index_users_1_on_country_id_and_score", order: { score: :desc }
    t.index ["country_id"], name: "users_1_country_id_idx"
    t.index ["score"], name: "index_users_1_on_score", order: :desc
  end

  create_table "users_10", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('users_id_seq'::regclass)" }, null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id", "score"], name: "index_users_10_on_country_id_and_score", order: { score: :desc }
    t.index ["country_id"], name: "users_10_country_id_idx"
    t.index ["score"], name: "index_users_10_on_score", order: :desc
  end

  create_table "users_2", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('users_id_seq'::regclass)" }, null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id", "score"], name: "index_users_2_on_country_id_and_score", order: { score: :desc }
    t.index ["country_id"], name: "users_2_country_id_idx"
    t.index ["score"], name: "index_users_2_on_score", order: :desc
  end

  create_table "users_3", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('users_id_seq'::regclass)" }, null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id", "score"], name: "index_users_3_on_country_id_and_score", order: { score: :desc }
    t.index ["country_id"], name: "users_3_country_id_idx"
    t.index ["score"], name: "index_users_3_on_score", order: :desc
  end

  create_table "users_4", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('users_id_seq'::regclass)" }, null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id", "score"], name: "index_users_4_on_country_id_and_score", order: { score: :desc }
    t.index ["country_id"], name: "users_4_country_id_idx"
    t.index ["score"], name: "index_users_4_on_score", order: :desc
  end

  create_table "users_5", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('users_id_seq'::regclass)" }, null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id", "score"], name: "index_users_5_on_country_id_and_score", order: { score: :desc }
    t.index ["country_id"], name: "users_5_country_id_idx"
    t.index ["score"], name: "index_users_5_on_score", order: :desc
  end

  create_table "users_6", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('users_id_seq'::regclass)" }, null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id", "score"], name: "index_users_6_on_country_id_and_score", order: { score: :desc }
    t.index ["country_id"], name: "users_6_country_id_idx"
    t.index ["score"], name: "index_users_6_on_score", order: :desc
  end

  create_table "users_7", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('users_id_seq'::regclass)" }, null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id", "score"], name: "index_users_7_on_country_id_and_score", order: { score: :desc }
    t.index ["country_id"], name: "users_7_country_id_idx"
    t.index ["score"], name: "index_users_7_on_score", order: :desc
  end

  create_table "users_8", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('users_id_seq'::regclass)" }, null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id", "score"], name: "index_users_8_on_country_id_and_score", order: { score: :desc }
    t.index ["country_id"], name: "users_8_country_id_idx"
    t.index ["score"], name: "index_users_8_on_score", order: :desc
  end

  create_table "users_9", primary_key: ["id", "score"], force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('users_id_seq'::regclass)" }, null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id", "score"], name: "index_users_9_on_country_id_and_score", order: { score: :desc }
    t.index ["country_id"], name: "users_9_country_id_idx"
    t.index ["score"], name: "index_users_9_on_score", order: :desc
  end

  add_foreign_key "users", "countries"
  add_foreign_key "users_1", "countries"
  add_foreign_key "users_10", "countries"
  add_foreign_key "users_2", "countries"
  add_foreign_key "users_3", "countries"
  add_foreign_key "users_4", "countries"
  add_foreign_key "users_5", "countries"
  add_foreign_key "users_6", "countries"
  add_foreign_key "users_7", "countries"
  add_foreign_key "users_8", "countries"
  add_foreign_key "users_9", "countries"
end
