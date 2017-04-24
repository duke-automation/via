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

ActiveRecord::Schema.define(version: 20160403144315) do

  create_table "boomerangs", force: :cascade do |t|
    t.string   "host",                 limit: 255
    t.string   "clientip",             limit: 255
    t.string   "method",               limit: 255
    t.integer  "nt_con_end",           limit: 8
    t.integer  "nt_con_st",            limit: 8
    t.integer  "nt_dns_end",           limit: 8
    t.integer  "nt_dns_st",            limit: 8
    t.integer  "nt_domcomp",           limit: 8
    t.integer  "nt_domcontloaded_end", limit: 8
    t.integer  "nt_domcontloaded_st",  limit: 8
    t.integer  "nt_domint",            limit: 8
    t.integer  "nt_domloading",        limit: 8
    t.integer  "nt_fet_st",            limit: 8
    t.integer  "nt_load_end",          limit: 8
    t.integer  "nt_load_st",           limit: 8
    t.integer  "nt_nav_st",            limit: 8
    t.integer  "nt_nav_type",          limit: 8
    t.integer  "nt_red_cnt",           limit: 8
    t.integer  "nt_red_end",           limit: 8
    t.integer  "nt_red_st",            limit: 8
    t.integer  "nt_req_st",            limit: 8
    t.integer  "nt_res_end",           limit: 8
    t.integer  "nt_res_st",            limit: 8
    t.integer  "nt_unload_end",        limit: 8
    t.integer  "nt_unload_st",         limit: 8
    t.string   "referer",              limit: 255
    t.datetime "req_time"
    t.integer  "rt_bstart",            limit: 8
    t.integer  "rt_end",               limit: 8
    t.string   "rt_start",             limit: 255
    t.integer  "rt_tstart",            limit: 8
    t.string   "user",                 limit: 255
    t.string   "useragent",            limit: 255
    t.string   "http_ver",             limit: 255
    t.string   "location",             limit: 255
    t.integer  "status",               limit: 4
    t.integer  "t_done",               limit: 8
    t.integer  "t_page",               limit: 8
    t.integer  "t_resp",               limit: 8
    t.string   "uri_path",             limit: 255
    t.string   "version",              limit: 255
    t.integer  "lat",                  limit: 4
    t.float    "lat_err",              limit: 24
    t.integer  "bw",                   limit: 8
    t.integer  "bw_err",               limit: 8
    t.integer  "bw_time",              limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
