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

ActiveRecord::Schema.define(version: 20151230003611) do

  create_table "banners", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "cover",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imgname",        limit: 255
    t.string   "link",           limit: 255
    t.integer  "destination_id", limit: 4
    t.integer  "travel_id",      limit: 4
  end

  create_table "bookings", force: :cascade do |t|
    t.string   "mrs_title",                limit: 255
    t.string   "first_name",               limit: 255
    t.string   "last_name",                limit: 255
    t.integer  "preferred_contact_method", limit: 4
    t.string   "email",                    limit: 255
    t.string   "phone",                    limit: 255
    t.string   "country",                  limit: 255
    t.string   "region",                   limit: 255
    t.string   "postal_code",              limit: 255
    t.boolean  "is_subscribe"
    t.integer  "user_id",                  limit: 4
    t.integer  "travel_id",                limit: 4
    t.integer  "datesprice_id",            limit: 4
    t.integer  "destination_id",           limit: 4
    t.integer  "people_count",             limit: 4
    t.string   "agent_name",               limit: 255
    t.string   "agent_code",               limit: 255
    t.text     "comment",                  limit: 65535
    t.boolean  "has_target"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",                  limit: 255
    t.string   "city",                     limit: 255
  end

  create_table "brochure_destinations", force: :cascade do |t|
    t.integer  "brochure_id",    limit: 4
    t.integer  "destination_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brochure_interests", force: :cascade do |t|
    t.integer  "brochure_id", limit: 4
    t.integer  "interest_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brochure_travels", force: :cascade do |t|
    t.integer  "brochure_id", limit: 4
    t.integer  "travel_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brochures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "desc",       limit: 65535
    t.string   "cover",      limit: 255
    t.string   "doc",        limit: 255
    t.text     "comment",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "destination_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gallery_id",     limit: 4
  end

  create_table "customizebookings", force: :cascade do |t|
    t.integer  "number",         limit: 4
    t.integer  "destination_id", limit: 4
    t.integer  "city_id",        limit: 4
    t.integer  "hotel_id",       limit: 4
    t.integer  "days",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gbooking_id",    limit: 4
  end

  create_table "datesprices", force: :cascade do |t|
    t.integer  "travel_id",              limit: 4
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "prices",                 limit: 4
    t.integer  "single_supplement",      limit: 4
    t.integer  "internal_airfare",       limit: 4
    t.integer  "availability_status",    limit: 4
    t.integer  "available_people_count", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destination_travels", force: :cascade do |t|
    t.integer  "destination_id", limit: 4
    t.integer  "travel_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "desc_title",          limit: 255
    t.text     "desc",                limit: 65535
    t.string   "banner_pic",          limit: 255
    t.string   "map_pic",             limit: 255
    t.text     "flights",             limit: 65535
    t.string   "timezone",            limit: 255
    t.text     "climate",             limit: 65535
    t.text     "health_requirements", limit: 65535
    t.text     "voltage",             limit: 65535
    t.text     "currency",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry",            limit: 255
    t.integer  "gallery_id",          limit: 4
    t.string   "flashmap",            limit: 255
  end

  add_index "destinations", ["ancestry"], name: "index_destinations_on_ancestry", using: :btree

  create_table "dianpins", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "cont",        limit: 65535
    t.string   "travel_code", limit: 255
    t.integer  "travel_id",   limit: 4
    t.integer  "user_id",     limit: 4
    t.boolean  "is_show"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editorimgs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "photo",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "cont",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "travel_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gbookingdays", force: :cascade do |t|
    t.integer  "destination_id", limit: 4
    t.integer  "city_id",        limit: 4
    t.integer  "hotel_id",       limit: 4
    t.integer  "days",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gbookings", force: :cascade do |t|
    t.string   "mrs_title",                limit: 255
    t.string   "first_name",               limit: 255
    t.string   "last_name",                limit: 255
    t.integer  "preferred_contact_method", limit: 4
    t.string   "email",                    limit: 255
    t.string   "phone",                    limit: 255
    t.string   "country",                  limit: 255
    t.string   "region",                   limit: 255
    t.string   "postal_code",              limit: 255
    t.boolean  "is_subscribe"
    t.integer  "user_id",                  limit: 4
    t.string   "agent_name",               limit: 255
    t.string   "agent_code",               limit: 255
    t.integer  "destination_id",           limit: 4
    t.datetime "departure_date"
    t.integer  "trip_day_length",          limit: 4
    t.integer  "adult_count",              limit: 4
    t.integer  "child_count",              limit: 4
    t.text     "event_comment",            limit: 65535
    t.text     "city_comment",             limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",                  limit: 255
    t.string   "city",                     limit: 255
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "destination_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gallery_id",     limit: 4
    t.integer  "city_id",        limit: 4
  end

  create_table "interest_travels", force: :cascade do |t|
    t.integer  "interest_id", limit: 4
    t.integer  "travel_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "cont",       limit: 65535
    t.string   "ancestry",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover",      limit: 255
  end

  add_index "interests", ["ancestry"], name: "index_interests_on_ancestry", using: :btree

  create_table "itineraries", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.text     "desc",          limit: 65535
    t.integer  "travel_id",     limit: 4
    t.integer  "sort",          limit: 4
    t.integer  "hotel_id",      limit: 4
    t.string   "meals",         limit: 255
    t.integer  "start_day_num", limit: 4
    t.integer  "end_day_num",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hotel_id2",     limit: 4
    t.integer  "hotel_id3",     limit: 4
    t.integer  "hotel_id4",     limit: 4
    t.integer  "hotel_id5",     limit: 4
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "title",      limit: 255
    t.text     "cont",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_type",  limit: 4,     default: 0
  end

  create_table "photocontests", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "name",       limit: 255
    t.string   "desc",       limit: 255
    t.string   "photo",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "sort",       limit: 4
    t.string   "pic",        limit: 255
    t.string   "desc",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gallery_id", limit: 4
  end

  create_table "presses", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "cont",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "mrs_title",                limit: 255
    t.string   "first_name",               limit: 255
    t.string   "last_name",                limit: 255
    t.integer  "preferred_contact_method", limit: 4
    t.string   "email",                    limit: 255
    t.string   "phone",                    limit: 255
    t.string   "country",                  limit: 255
    t.text     "question",                 limit: 65535
    t.integer  "travel_id",                limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                  limit: 4
  end

  create_table "shouyes", force: :cascade do |t|
    t.text     "logo",           limit: 65535
    t.text     "title",          limit: 65535
    t.text     "phone",          limit: 65535
    t.text     "lianxi",         limit: 65535
    t.text     "block_1_tit",    limit: 65535
    t.text     "block_1_cont",   limit: 65535
    t.string   "block_2_pic_1",  limit: 255
    t.string   "block_2_pic_2",  limit: 255
    t.text     "block_2_tit",    limit: 65535
    t.text     "block_2_cont",   limit: 65535
    t.text     "block_2_link",   limit: 65535
    t.text     "block_3_tit",    limit: 65535
    t.text     "block_3_cont",   limit: 65535
    t.string   "block_3_pic",    limit: 255
    t.text     "block_3_link",   limit: 65535
    t.text     "block_4_tit",    limit: 65535
    t.string   "block_4_1_pic",  limit: 255
    t.string   "block_4_1_tit",  limit: 255
    t.text     "block_4_1_cont", limit: 65535
    t.string   "block_4_1_link", limit: 255
    t.string   "block_4_2_pic",  limit: 255
    t.string   "block_4_2_tit",  limit: 255
    t.text     "block_4_2_cont", limit: 65535
    t.string   "block_4_2_link", limit: 255
    t.string   "block_4_3_pic",  limit: 255
    t.string   "block_4_3_tit",  limit: 255
    t.text     "block_4_3_cont", limit: 65535
    t.string   "block_4_3_link", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "block_5_cont",   limit: 65535
  end

  create_table "specialoffer_travels", force: :cascade do |t|
    t.integer  "specialoffer_id", limit: 4
    t.integer  "travel_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "datesprice_id",   limit: 4
  end

  create_table "specialoffers", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "desc",       limit: 65535
    t.text     "cont",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover",      limit: 255
  end

  create_table "travel_pages", force: :cascade do |t|
    t.integer  "travel_id",  limit: 4
    t.string   "url",        limit: 255
    t.string   "name",       limit: 255
    t.string   "category",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travels", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "sub_name",           limit: 255
    t.integer  "priced_from",        limit: 4
    t.integer  "days_count",         limit: 4
    t.integer  "departures",         limit: 4
    t.integer  "max_group_size",     limit: 4
    t.text     "overview_desc",      limit: 65535
    t.text     "overview_advantage", limit: 65535
    t.text     "notes",              limit: 65535
    t.text     "extensions_ids",     limit: 65535
    t.text     "itinerary_pic",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover",              limit: 255
    t.text     "itinerary_bigpic",   limit: 65535
    t.text     "desc_mappic",        limit: 65535
    t.integer  "gallery_id",         limit: 4
    t.text     "jindian",            limit: 65535
    t.string   "travel_type",        limit: 255
    t.integer  "position",           limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "login",                  limit: 255
    t.string   "home_phone",             limit: 255
    t.string   "cellphone",              limit: 255
    t.string   "address",                limit: 255
    t.string   "city",                   limit: 255
    t.string   "region",                 limit: 255
    t.string   "country",                limit: 255
    t.string   "postal_code",            limit: 255
    t.boolean  "has_past"
    t.string   "title",                  limit: 255
    t.datetime "birth_date"
    t.string   "travel_agent",           limit: 255
    t.string   "travel_agent_code",      limit: 255
    t.string   "provider",               limit: 255
    t.integer  "uid",                    limit: 4
    t.string   "profile_url",            limit: 255
    t.string   "profile_image_url",      limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
