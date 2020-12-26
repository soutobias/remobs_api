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

ActiveRecord::Schema.define(version: 2020_12_24_131306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buoys", primary_key: "id_boia", id: :integer, default: nil, force: :cascade do |t|
    t.string "name_buoy", limit: 20
    t.string "model", limit: 20
    t.decimal "lat", precision: 9, scale: 6
    t.decimal "lon", precision: 9, scale: 6
    t.integer "depth"
    t.datetime "deploy_date"
    t.string "status", limit: 20
    t.string "wmo_number", limit: 20
    t.integer "duration_wave"
    t.decimal "h_sensor_pres"
    t.decimal "d_sensor_wtmp"
    t.decimal "wtmp_prec"
    t.decimal "wind_avg"
    t.decimal "h_sensor_wind"
    t.decimal "h_sensor_atmp"
    t.integer "gust_avg"
    t.integer "atmp_avg"
    t.decimal "d_curr"
  end

  create_table "data_buoys", primary_key: ["id", "id_buoy"], force: :cascade do |t|
    t.integer "id", null: false
    t.integer "id_buoy", null: false
    t.decimal "lat", precision: 9, scale: 6
    t.decimal "lon", precision: 9, scale: 6
    t.datetime "date_time"
    t.decimal "battery", precision: 10, scale: 2
    t.integer "compass"
    t.integer "flag_compass"
    t.integer "flood"
    t.decimal "rh", precision: 10, scale: 2
    t.integer "flag_rh"
    t.decimal "pres", precision: 10, scale: 1
    t.integer "flag_pres"
    t.decimal "atmp", precision: 10, scale: 2
    t.integer "flag_atmp"
    t.decimal "dewpt", precision: 10, scale: 2
    t.integer "flag_dewpt"
    t.decimal "wspd", precision: 10, scale: 2
    t.integer "flag_wspd"
    t.integer "wdir"
    t.integer "flag_wdir"
    t.decimal "gust", precision: 10, scale: 2
    t.integer "flag_gust"
    t.decimal "arad", precision: 10, scale: 2
    t.integer "flag_arad"
    t.decimal "sst", precision: 10, scale: 2
    t.integer "flag_sst"
    t.decimal "cspd1", precision: 10, scale: 2
    t.integer "flag_cspd1"
    t.integer "cdir1"
    t.integer "flag_cdir1"
    t.decimal "cspd2", precision: 10, scale: 2
    t.integer "flag_cspd2"
    t.integer "cdir2"
    t.integer "flag_cdir2"
    t.decimal "cspd3", precision: 10, scale: 2
    t.integer "flag_cspd3"
    t.integer "cdir3"
    t.integer "flag_cdir3"
    t.decimal "swvht1", precision: 10, scale: 2
    t.integer "flag_swvht1"
    t.decimal "swvht2", precision: 16, scale: 2
    t.integer "flag_swvht2"
    t.decimal "mxwvht1", precision: 10, scale: 2
    t.integer "flag_mxwvht1"
    t.decimal "tp1", precision: 10, scale: 1
    t.integer "flag_tp1"
    t.decimal "tp2", precision: 10, scale: 1
    t.integer "flag_tp2"
    t.integer "wvdir1"
    t.integer "flag_wvdir1"
    t.integer "wvdir2"
    t.integer "flag_wvdir2"
    t.integer "wvspread1"
    t.integer "flag_wvspread1"
    t.integer "pk_dir"
    t.integer "flag_pk_dir"
    t.integer "pk_wvspread"
    t.integer "flag_pk_wvspread"
    t.decimal "mean_tp", precision: 10, scale: 1
    t.integer "flag_mean_tp"
  end

  create_table "names_dictionaries", id: :serial, force: :cascade do |t|
    t.string "short_names", limit: 20, null: false
    t.string "long_names", limit: 100, null: false
    t.string "units", limit: 20, null: false
    t.index ["short_names"], name: "names_dictionaries_short_names_key", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "data_buoys", "buoys", column: "id_buoy", primary_key: "id_boia", name: "fk_buoy_data", on_update: :cascade
end
