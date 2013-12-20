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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131025074956) do

  create_table "_contract_status_bak_bir", :id => false, :force => true do |t|
    t.integer "id",                     :default => 0, :null => false
    t.integer "cid",                                   :null => false
    t.integer "status",  :limit => 1,                  :null => false
    t.integer "uid",                                   :null => false
    t.date    "date1",                                 :null => false
    t.date    "date2"
    t.string  "comment", :limit => 250,                :null => false
  end

  create_table "address_area", :force => true do |t|
    t.string  "title",  :limit => 150, :default => "0", :null => false
    t.integer "cityid",                :default => -1,  :null => false
  end

  create_table "address_city", :force => true do |t|
    t.integer "country_id",                :default => 1,   :null => false
    t.string  "title",      :limit => 150, :default => "0", :null => false
    t.integer "pos",                       :default => 1
  end

  create_table "address_config", :id => false, :force => true do |t|
    t.string  "table_id",  :limit => 50, :null => false
    t.integer "record_id",               :null => false
    t.string  "key",       :limit => 50, :null => false
    t.text    "value",                   :null => false
  end

  create_table "address_country", :force => true do |t|
    t.string    "title",       :default => "", :null => false
    t.timestamp "last_update",                 :null => false
  end

  create_table "address_house", :force => true do |t|
    t.integer "cityid_",                     :default => 0,  :null => false
    t.integer "streetid",                    :default => 0,  :null => false
    t.integer "house",                       :default => 0,  :null => false
    t.string  "frac",         :limit => 30
    t.integer "amount",       :limit => 2,   :default => 0,  :null => false
    t.string  "comment",      :limit => 100
    t.integer "areaid",                      :default => 0,  :null => false
    t.integer "quarterid",                   :default => 0,  :null => false
    t.string  "box_index",    :limit => 10
    t.date    "dt"
    t.text    "pod_diapazon",                                :null => false
    t.string  "pod",          :limit => 200, :default => "", :null => false
  end

  add_index "address_house", ["streetid", "house", "frac"], :name => "HouseU", :unique => true

  create_table "address_quarter", :force => true do |t|
    t.string  "title",  :limit => 150, :default => "0", :null => false
    t.integer "gid"
    t.integer "cityid",                :default => -1,  :null => false
  end

  create_table "address_street", :force => true do |t|
    t.string  "title",   :limit => 150, :default => "0", :null => false
    t.string  "p_index", :limit => 6,   :default => "",  :null => false
    t.integer "cityid",                 :default => -1,  :null => false
  end

  create_table "agent_payments", :force => true do |t|
    t.integer  "contract_id"
    t.integer  "user_id"
    t.integer  "manager_id"
    t.decimal  "value",           :precision => 10, :scale => 0
    t.string   "text"
    t.datetime "managed_at"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "confirmation_id"
    t.datetime "confirmation_at"
  end

  add_index "agent_payments", ["contract_id"], :name => "index_agent_payments_on_contract_id"
  add_index "agent_payments", ["manager_id"], :name => "index_agent_payments_on_manager_id"
  add_index "agent_payments", ["user_id"], :name => "index_agent_payments_on_user_id"

  create_table "bgs_group", :force => true do |t|
    t.string  "title",    :limit => 250, :default => "", :null => false
    t.string  "comment",  :limit => 250, :default => "", :null => false
    t.integer "cgr",      :limit => 8,   :default => 0,  :null => false
    t.string  "pids",     :limit => 120
    t.integer "cgr_mode", :limit => 1,   :default => 1,  :null => false
  end

  create_table "bgs_group_action", :id => false, :force => true do |t|
    t.integer "gid",               :default => 0, :null => false
    t.string  "mid", :limit => 10,                :null => false
    t.integer "aid",               :default => 0, :null => false
  end

  add_index "bgs_group_action", ["gid"], :name => "gid"

  create_table "bgs_group_menu", :id => false, :force => true do |t|
    t.integer "gid",                   :null => false
    t.string  "menu_id", :limit => 50, :null => false
    t.integer "hidden",  :limit => 1,  :null => false
  end

  create_table "bgs_module_action", :primary_key => "module", :force => true do |t|
    t.text "data", :null => false
  end

  create_table "bgs_query_log_201007", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201007", ["cid"], :name => "cid"
  add_index "bgs_query_log_201007", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201007", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201007", ["uid"], :name => "uid"

  create_table "bgs_query_log_201008", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201008", ["cid"], :name => "cid"
  add_index "bgs_query_log_201008", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201008", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201008", ["uid"], :name => "uid"

  create_table "bgs_query_log_201009", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201009", ["cid"], :name => "cid"
  add_index "bgs_query_log_201009", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201009", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201009", ["uid"], :name => "uid"

  create_table "bgs_query_log_201010", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201010", ["cid"], :name => "cid"
  add_index "bgs_query_log_201010", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201010", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201010", ["uid"], :name => "uid"

  create_table "bgs_query_log_201011", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201011", ["cid"], :name => "cid"
  add_index "bgs_query_log_201011", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201011", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201011", ["uid"], :name => "uid"

  create_table "bgs_query_log_201012", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201012", ["cid"], :name => "cid"
  add_index "bgs_query_log_201012", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201012", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201012", ["uid"], :name => "uid"

  create_table "bgs_query_log_201101", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201101", ["cid"], :name => "cid"
  add_index "bgs_query_log_201101", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201101", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201101", ["uid"], :name => "uid"

  create_table "bgs_query_log_201102", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201102", ["cid"], :name => "cid"
  add_index "bgs_query_log_201102", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201102", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201102", ["uid"], :name => "uid"

  create_table "bgs_query_log_201103", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201103", ["cid"], :name => "cid"
  add_index "bgs_query_log_201103", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201103", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201103", ["uid"], :name => "uid"

  create_table "bgs_query_log_201104", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201104", ["cid"], :name => "cid"
  add_index "bgs_query_log_201104", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201104", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201104", ["uid"], :name => "uid"

  create_table "bgs_query_log_201105", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201105", ["cid"], :name => "cid"
  add_index "bgs_query_log_201105", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201105", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201105", ["uid"], :name => "uid"

  create_table "bgs_query_log_201106", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201106", ["cid"], :name => "cid"
  add_index "bgs_query_log_201106", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201106", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201106", ["uid"], :name => "uid"

  create_table "bgs_query_log_201107", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201107", ["cid"], :name => "cid"
  add_index "bgs_query_log_201107", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201107", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201107", ["uid"], :name => "uid"

  create_table "bgs_query_log_201108", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201108", ["cid"], :name => "cid"
  add_index "bgs_query_log_201108", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201108", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201108", ["uid"], :name => "uid"

  create_table "bgs_query_log_201109", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201109", ["cid"], :name => "cid"
  add_index "bgs_query_log_201109", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201109", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201109", ["uid"], :name => "uid"

  create_table "bgs_query_log_201110", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201110", ["cid"], :name => "cid"
  add_index "bgs_query_log_201110", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201110", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201110", ["uid"], :name => "uid"

  create_table "bgs_query_log_201111", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201111", ["cid"], :name => "cid"
  add_index "bgs_query_log_201111", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201111", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201111", ["uid"], :name => "uid"

  create_table "bgs_query_log_201112", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201112", ["cid"], :name => "cid"
  add_index "bgs_query_log_201112", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201112", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201112", ["uid"], :name => "uid"

  create_table "bgs_query_log_201201", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201201", ["cid"], :name => "cid"
  add_index "bgs_query_log_201201", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201201", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201201", ["uid"], :name => "uid"

  create_table "bgs_query_log_201202", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201202", ["cid"], :name => "cid"
  add_index "bgs_query_log_201202", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201202", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201202", ["uid"], :name => "uid"

  create_table "bgs_query_log_201203", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201203", ["cid"], :name => "cid"
  add_index "bgs_query_log_201203", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201203", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201203", ["uid"], :name => "uid"

  create_table "bgs_query_log_201204", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201204", ["cid"], :name => "cid"
  add_index "bgs_query_log_201204", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201204", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201204", ["uid"], :name => "uid"

  create_table "bgs_query_log_201205", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201205", ["cid"], :name => "cid"
  add_index "bgs_query_log_201205", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201205", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201205", ["uid"], :name => "uid"

  create_table "bgs_query_log_201206", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201206", ["cid"], :name => "cid"
  add_index "bgs_query_log_201206", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201206", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201206", ["uid"], :name => "uid"

  create_table "bgs_query_log_201207", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201207", ["cid"], :name => "cid"
  add_index "bgs_query_log_201207", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201207", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201207", ["uid"], :name => "uid"

  create_table "bgs_query_log_201208", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201208", ["cid"], :name => "cid"
  add_index "bgs_query_log_201208", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201208", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201208", ["uid"], :name => "uid"

  create_table "bgs_query_log_201209", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201209", ["cid"], :name => "cid"
  add_index "bgs_query_log_201209", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201209", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201209", ["uid"], :name => "uid"

  create_table "bgs_query_log_201210", :id => false, :force => true do |t|
    t.datetime "dtime",                  :null => false
    t.integer  "uid",                    :null => false
    t.string   "ip",      :limit => 20,  :null => false
    t.integer  "cid",                    :null => false
    t.string   "mid_aid", :limit => 100, :null => false
    t.text     "action",                 :null => false
    t.text     "query",                  :null => false
    t.string   "c_title", :limit => 150, :null => false
    t.string   "u_name",  :limit => 50,  :null => false
    t.string   "m_title", :limit => 150, :null => false
  end

  add_index "bgs_query_log_201210", ["cid"], :name => "cid"
  add_index "bgs_query_log_201210", ["dtime"], :name => "dtime"
  add_index "bgs_query_log_201210", ["mid_aid"], :name => "mid_aid"
  add_index "bgs_query_log_201210", ["uid"], :name => "uid"

  create_table "bgs_user_action", :id => false, :force => true do |t|
    t.integer "uid",               :default => 0, :null => false
    t.string  "mid", :limit => 10,                :null => false
    t.integer "aid",               :default => 0, :null => false
  end

  add_index "bgs_user_action", ["uid"], :name => "uid"

  create_table "bgs_user_group", :id => false, :force => true do |t|
    t.integer "uid", :default => 0, :null => false
    t.integer "gid", :default => 0, :null => false
  end

  add_index "bgs_user_group", ["gid"], :name => "gid"
  add_index "bgs_user_group", ["uid"], :name => "uid"

  create_table "bill_account_2", :force => true do |t|
    t.string  "title",                      :null => false
    t.string  "bank_title",                 :null => false
    t.string  "account",      :limit => 30, :null => false
    t.string  "bik",          :limit => 30, :null => false
    t.string  "corr_account", :limit => 30, :null => false
    t.integer "pid",                        :null => false
    t.integer "gr",           :limit => 8,  :null => false
    t.text    "comment"
  end

  create_table "bill_attribute_2", :force => true do |t|
    t.integer "cid",   :null => false
    t.string  "name",  :null => false
    t.string  "value", :null => false
    t.date    "start"
    t.date    "end"
  end

  add_index "bill_attribute_2", ["cid"], :name => "cid"

  create_table "bill_contract_doc_type_2", :force => true do |t|
    t.integer "cid",      :default => 0, :null => false
    t.integer "doc_type", :default => 0, :null => false
  end

  add_index "bill_contract_doc_type_2", ["cid"], :name => "cid"

  create_table "bill_data_2", :force => true do |t|
    t.integer "cid",                                                                               :null => false
    t.integer "type",                                                                              :null => false
    t.integer "account_id",                                                                        :null => false
    t.integer "number",                                                                            :null => false
    t.integer "number_in_month",                                                                   :null => false
    t.integer "number_in_year",                                                                    :null => false
    t.string  "format_number",   :limit => 30,                                                     :null => false
    t.integer "uid",                                                                               :null => false
    t.integer "yy",                                                                                :null => false
    t.integer "mm",                                                                                :null => false
    t.date    "create_dt"
    t.date    "pay_dt"
    t.integer "status",          :limit => 1,                                                      :null => false
    t.integer "unload_status",                                                                     :null => false
    t.decimal "summ",                                :precision => 12, :scale => 2,                :null => false
    t.binary  "xml",             :limit => 16777215,                                               :null => false
    t.integer "payment_id",                                                                        :null => false
    t.integer "npid",                                                               :default => 1
    t.integer "pay_uid"
  end

  add_index "bill_data_2", ["cid"], :name => "cid"
  add_index "bill_data_2", ["create_dt"], :name => "create_dt"
  add_index "bill_data_2", ["mm"], :name => "mm"
  add_index "bill_data_2", ["yy"], :name => "yy"

  create_table "bill_doc_type_2", :force => true do |t|
    t.integer "type",     :limit => 1,   :default => 0,  :null => false
    t.string  "title",    :limit => 200, :default => "", :null => false
    t.string  "pattern",  :limit => 200,                 :null => false
    t.text    "pos_list",                                :null => false
    t.integer "opt",      :limit => 1,                   :null => false
    t.string  "comment",  :limit => 250, :default => "", :null => false
    t.text    "setup"
    t.integer "npid",                    :default => 1
  end

  create_table "bill_invoice_data_2", :force => true do |t|
    t.integer "cid",                                                                               :null => false
    t.integer "type",                                                                              :null => false
    t.integer "number",                                                                            :null => false
    t.integer "number_in_month",                                                                   :null => false
    t.integer "number_in_year",                                                                    :null => false
    t.string  "format_number",   :limit => 30,                                                     :null => false
    t.integer "yy",                                                                                :null => false
    t.integer "mm",                                                                                :null => false
    t.date    "create_dt"
    t.integer "unload_status",                                                                     :null => false
    t.decimal "summ",                                :precision => 12, :scale => 2,                :null => false
    t.integer "show_ready",      :limit => 1,                                                      :null => false
    t.binary  "xml",             :limit => 16777215,                                               :null => false
    t.integer "npid",                                                               :default => 2
  end

  add_index "bill_invoice_data_2", ["cid"], :name => "cid"
  add_index "bill_invoice_data_2", ["create_dt"], :name => "create_dt"
  add_index "bill_invoice_data_2", ["mm"], :name => "mm"
  add_index "bill_invoice_data_2", ["yy"], :name => "yy"

  create_table "bill_numeration_pool_2", :force => true do |t|
    t.string "title",   :limit => 50
    t.string "pattern", :limit => 50
  end

  create_table "bill_numeration_pool_2_log", :force => true do |t|
    t.integer   "uid",         :default => 0, :null => false
    t.integer   "cid",         :default => 0, :null => false
    t.integer   "oid",         :default => 0, :null => false
    t.text      "description"
    t.integer   "action",      :default => 0, :null => false
    t.timestamp "dt",                         :null => false
  end

  create_table "billing_event_bus", :force => true do |t|
    t.timestamp "time",                        :null => false
    t.binary    "event", :limit => 2147483647
  end

  create_table "calculate_period_1", :force => true do |t|
    t.integer "cid",   :default => 0, :null => false
    t.date    "start"
    t.date    "end"
  end

  add_index "calculate_period_1", ["cid"], :name => "cid"

  create_table "calculate_period_6", :force => true do |t|
    t.integer "cid",   :default => 0, :null => false
    t.date    "start"
    t.date    "end"
  end

  add_index "calculate_period_6", ["cid"], :name => "cid"

  create_table "calculate_period_8", :force => true do |t|
    t.integer "cid",   :default => 0, :null => false
    t.date    "start"
    t.date    "end"
  end

  add_index "calculate_period_8", ["cid"], :name => "cid"

  create_table "card_action_11", :force => true do |t|
    t.integer  "type",      :limit => 1,  :null => false
    t.datetime "dtime"
    t.integer  "dealer_id",               :null => false
    t.integer  "count",                   :null => false
    t.float    "summ",      :limit => 20, :null => false
    t.float    "cost",      :limit => 20, :null => false
  end

  create_table "card_action_12", :force => true do |t|
    t.integer  "type",      :limit => 1,  :null => false
    t.datetime "dtime"
    t.integer  "dealer_id",               :null => false
    t.integer  "count",                   :null => false
    t.float    "summ",      :limit => 20, :null => false
    t.float    "cost",      :limit => 20, :null => false
  end

  create_table "card_action_13", :force => true do |t|
    t.integer  "type",      :limit => 1,  :null => false
    t.datetime "dtime"
    t.integer  "dealer_id",               :null => false
    t.integer  "count",                   :null => false
    t.float    "summ",      :limit => 20, :null => false
    t.float    "cost",      :limit => 20, :null => false
  end

  create_table "card_action_card_11", :id => false, :force => true do |t|
    t.integer "action_id", :null => false
    t.integer "card_id",   :null => false
  end

  add_index "card_action_card_11", ["action_id"], :name => "action_id"

  create_table "card_action_card_12", :id => false, :force => true do |t|
    t.integer "action_id", :null => false
    t.integer "card_id",   :null => false
  end

  add_index "card_action_card_12", ["action_id"], :name => "action_id"

  create_table "card_action_card_13", :id => false, :force => true do |t|
    t.integer "action_id", :null => false
    t.integer "card_id",   :null => false
  end

  add_index "card_action_card_13", ["action_id"], :name => "action_id"

  create_table "card_data_13", :force => true do |t|
    t.integer  "card_code",                   :default => 0,   :null => false
    t.integer  "cs_id",                       :default => 0,   :null => false
    t.string   "card_pin_code", :limit => 32, :default => "",  :null => false
    t.float    "summa",                       :default => 0.0, :null => false
    t.date     "date1"
    t.date     "date2"
    t.integer  "status",        :limit => 1,  :default => 0,   :null => false
    t.integer  "sid_pay",                     :default => 0,   :null => false
    t.integer  "sid_act",                     :default => 0,   :null => false
    t.integer  "pid",                         :default => 0,   :null => false
    t.integer  "pt",                          :default => 0,   :null => false
    t.integer  "did",                         :default => 0,   :null => false
    t.date     "d_date"
    t.integer  "cid",                         :default => 0,   :null => false
    t.datetime "date"
  end

  add_index "card_data_13", ["card_code"], :name => "cc"
  add_index "card_data_13", ["cs_id"], :name => "cs_id"
  add_index "card_data_13", ["did"], :name => "did"
  add_index "card_data_13", ["sid_act"], :name => "sid_act"
  add_index "card_data_13", ["sid_pay"], :name => "sid_pay"

  create_table "card_dealer_13", :force => true do |t|
    t.integer "type",                              :default => 0,   :null => false
    t.string  "title",              :limit => 150, :default => "",  :null => false
    t.date    "date1"
    t.date    "date2"
    t.string  "login",              :limit => 15,  :default => "",  :null => false
    t.string  "pswd",               :limit => 32
    t.string  "pt",                                :default => "0"
    t.string  "comment",                           :default => "",  :null => false
    t.integer "error",                                              :null => false
    t.string  "ip",                 :limit => 15,                   :null => false
    t.integer "params",                            :default => 0
    t.integer "cansel_time"
    t.integer "st_request",                        :default => 0,   :null => false
    t.integer "st_finded",                         :default => 0,   :null => false
    t.integer "st_payed",                          :default => 0,   :null => false
    t.integer "cid",                                                :null => false
    t.float   "card_percent",       :limit => 10,                   :null => false
    t.float   "pay_percent",        :limit => 10,                   :null => false
    t.string  "card_contract",      :limit => 250,                  :null => false
    t.string  "pay_contract",       :limit => 250,                  :null => false
    t.integer "pay_comission_type", :limit => 1,                    :null => false
    t.integer "contract_id",                                        :null => false
  end

  create_table "card_series_11", :force => true do |t|
    t.string  "title"
    t.integer "free",  :null => false
  end

  create_table "card_series_12", :force => true do |t|
    t.string  "title"
    t.integer "free",  :null => false
  end

  create_table "card_series_13", :force => true do |t|
    t.string  "title"
    t.integer "free",  :null => false
  end

  create_table "contract", :force => true do |t|
    t.integer  "gr",                 :limit => 8,                                  :default => 0,     :null => false
    t.string   "title",              :limit => 150,                                :default => "",    :null => false
    t.integer  "title_pattern_id",                                                                    :null => false
    t.string   "pswd",               :limit => 32,                                 :default => "",    :null => false
    t.date     "date1"
    t.date     "date2"
    t.integer  "mode",               :limit => 1,                                  :default => 0,     :null => false
    t.decimal  "closesumma",                        :precision => 10, :scale => 2,                    :null => false
    t.integer  "pgid",                                                             :default => 0,     :null => false
    t.integer  "pfid",                                                             :default => 0,     :null => false
    t.boolean  "fc",                                                               :default => false, :null => false
    t.string   "comment",            :limit => 100,                                :default => "",    :null => false
    t.boolean  "del",                                                              :default => false, :null => false
    t.integer  "scid",                                                             :default => 0,     :null => false
    t.text     "sub_list",                                                                            :null => false
    t.integer  "sub_mode",           :limit => 1,                                                     :null => false
    t.integer  "status",             :limit => 1,                                  :default => 0,     :null => false
    t.date     "status_date"
    t.datetime "last_tariff_change"
    t.integer  "crm_customer_id",                                                  :default => 0,     :null => false
  end

  add_index "contract", ["crm_customer_id"], :name => "crm_customer_id"
  add_index "contract", ["crm_customer_id"], :name => "crm_id"
  add_index "contract", ["date1"], :name => "date1"
  add_index "contract", ["del"], :name => "del"
  add_index "contract", ["scid"], :name => "scid"
  add_index "contract", ["title"], :name => "title"

  create_table "contract_account", :id => false, :force => true do |t|
    t.integer "yy",    :limit => 2,                                :default => 0, :null => false
    t.integer "mm",    :limit => 1,                                :default => 0, :null => false
    t.integer "cid",                                               :default => 0, :null => false
    t.integer "sid",                                               :default => 0, :null => false
    t.decimal "summa",              :precision => 15, :scale => 5
  end

  add_index "contract_account", ["cid"], :name => "cid"

  create_table "contract_balance", :id => false, :force => true do |t|
    t.integer "yy",     :limit => 2,                                :default => 0, :null => false
    t.integer "mm",     :limit => 1,                                :default => 0, :null => false
    t.integer "cid",                                                :default => 0, :null => false
    t.decimal "summa1",              :precision => 10, :scale => 2,                :null => false
    t.decimal "summa2",              :precision => 10, :scale => 2,                :null => false
    t.decimal "summa3",              :precision => 10, :scale => 2,                :null => false
    t.decimal "summa4",              :precision => 10, :scale => 2,                :null => false
  end

  add_index "contract_balance", ["cid"], :name => "cid"

  create_table "contract_charge", :force => true do |t|
    t.date      "dt",                                                                    :null => false
    t.integer   "cid",                                                   :default => 0,  :null => false
    t.integer   "pt",                                                    :default => 0,  :null => false
    t.integer   "uid",                                                   :default => 0,  :null => false
    t.decimal   "summa",                  :precision => 10, :scale => 2,                 :null => false
    t.string    "comment", :limit => 200,                                :default => "", :null => false
    t.timestamp "lm",                                                                    :null => false
  end

  add_index "contract_charge", ["cid", "dt"], :name => "cid_dt"
  add_index "contract_charge", ["cid"], :name => "cid"
  add_index "contract_charge", ["dt", "cid"], :name => "dt_cid"
  add_index "contract_charge", ["pt"], :name => "pt"
  add_index "contract_charge", ["uid"], :name => "uid"

  create_table "contract_charge_types", :force => true do |t|
    t.string  "title", :limit => 50, :default => "", :null => false
    t.integer "flag",  :limit => 1,  :default => 0,  :null => false
    t.integer "type",  :limit => 1,  :default => 0,  :null => false
    t.integer "up",                  :default => 0,  :null => false
  end

  create_table "contract_comment", :force => true do |t|
    t.integer  "cid",                   :default => 0,      :null => false
    t.integer  "uid",                   :default => 0,      :null => false
    t.string   "subject",               :default => "",     :null => false
    t.text     "comment",                                   :null => false
    t.datetime "dt",                                        :null => false
    t.binary   "visibled", :limit => 1, :default => "b'0'", :null => false
  end

  add_index "contract_comment", ["cid"], :name => "cid"

  create_table "contract_comment_patterns", :force => true do |t|
    t.string "title", :limit => 25, :null => false
    t.string "pat",                 :null => false
  end

  create_table "contract_delete_money", :force => true do |t|
    t.string  "name",                 :default => "", :null => false
    t.integer "money",                :default => 0,  :null => false
    t.integer "time",                 :default => 0,  :null => false
    t.integer "gr",      :limit => 8, :default => 0,  :null => false
    t.date    "date1"
    t.date    "date2"
    t.string  "comment",              :default => "", :null => false
  end

  create_table "contract_delete_time", :force => true do |t|
    t.string  "name",                 :default => "", :null => false
    t.integer "time",                 :default => 0,  :null => false
    t.integer "gr",      :limit => 8, :default => 0,  :null => false
    t.date    "date1"
    t.date    "date2"
    t.string  "comment",              :default => "", :null => false
  end

  create_table "contract_document_7", :force => true do |t|
    t.integer   "cid",        :null => false
    t.integer   "journal_id", :null => false
    t.integer   "type",       :null => false
    t.string    "title",      :null => false
    t.timestamp "date",       :null => false
    t.integer   "user",       :null => false
    t.text      "comment",    :null => false
  end

  create_table "contract_document_journal_7", :force => true do |t|
    t.string "title", :null => false
  end

  create_table "contract_document_status_list_7", :force => true do |t|
    t.integer   "id_document", :null => false
    t.timestamp "date",        :null => false
    t.integer   "status",      :null => false
    t.integer   "user",        :null => false
    t.text      "comment",     :null => false
  end

  create_table "contract_document_statuses_7", :force => true do |t|
    t.string "title", :limit => 128, :null => false
  end

  create_table "contract_document_types_7", :force => true do |t|
    t.string "title", :limit => 128, :null => false
  end

  create_table "contract_error", :force => true do |t|
    t.date    "dt",                                       :null => false
    t.integer "hh",        :limit => 1,   :default => 0,  :null => false
    t.integer "cid",                      :default => 0,  :null => false
    t.string  "msg_title", :limit => 100, :default => "", :null => false
    t.text    "msg_data",                                 :null => false
  end

  add_index "contract_error", ["dt", "cid"], :name => "dt"

  create_table "contract_group", :force => true do |t|
    t.string  "title",    :limit => 100, :default => "", :null => false
    t.integer "enable",   :limit => 1,   :default => 0,  :null => false
    t.integer "editable", :limit => 1,   :default => 1,  :null => false
  end

  add_index "contract_group", ["enable"], :name => "enable"

  create_table "contract_limit_manage", :force => true do |t|
    t.integer  "cid",                                                                   :null => false
    t.integer  "clp_id"
    t.decimal  "summ",                  :precision => 10, :scale => 2,                  :null => false
    t.datetime "date1",                                                                 :null => false
    t.date     "date2"
    t.string   "pids",   :limit => 100
    t.float    "rest",   :limit => 10,                                 :default => 0.0, :null => false
    t.integer  "status",                                               :default => 0
  end

  add_index "contract_limit_manage", ["cid"], :name => "cid"
  add_index "contract_limit_manage", ["clp_id"], :name => "clp_id"

  create_table "contract_limit_manage_mode", :primary_key => "cid", :force => true do |t|
    t.integer "mode", :default => 0, :null => false
    t.integer "cnt",  :default => 0, :null => false
  end

  create_table "contract_limit_period", :force => true do |t|
    t.integer "uid",                                  :default => 0, :null => false
    t.integer "cid",                                  :default => 0, :null => false
    t.date    "dt"
    t.decimal "value", :precision => 10, :scale => 2,                :null => false
  end

  add_index "contract_limit_period", ["dt"], :name => "dt"

  create_table "contract_logon_error", :id => false, :force => true do |t|
    t.timestamp "lu",                         :null => false
    t.integer   "cid",                        :null => false
    t.string    "login",                      :null => false
    t.datetime  "dt",                         :null => false
    t.string    "ip",           :limit => 15, :null => false
    t.integer   "error_code",                 :null => false
    t.text      "request_data",               :null => false
  end

  add_index "contract_logon_error", ["cid", "dt"], :name => "cid_dt"
  add_index "contract_logon_error", ["login", "dt"], :name => "login_dt"

  create_table "contract_logon_last", :primary_key => "cid", :force => true do |t|
    t.timestamp "lu",               :null => false
    t.datetime  "dt",               :null => false
    t.integer   "n",                :null => false
    t.string    "ip", :limit => 15, :null => false
  end

  create_table "contract_logon_ok", :id => false, :force => true do |t|
    t.timestamp "lu",                                        :null => false
    t.integer   "cid",                                       :null => false
    t.datetime  "dt",                                        :null => false
    t.string    "ip",         :limit => 15,                  :null => false
    t.string    "session_id", :limit => 32,                  :null => false
    t.string    "user",       :limit => 1,  :default => "c", :null => false
  end

  add_index "contract_logon_ok", ["cid", "dt"], :name => "new_index"

  create_table "contract_module", :id => false, :force => true do |t|
    t.integer "cid", :null => false
    t.integer "mid", :null => false
  end

  create_table "contract_notification", :force => true do |t|
    t.integer  "cid",     :null => false
    t.string   "subject", :null => false
    t.text     "message", :null => false
    t.datetime "dt",      :null => false
    t.boolean  "is_read", :null => false
  end

  create_table "contract_parameter_group", :id => false, :force => true do |t|
    t.integer "gid", :default => 0, :null => false
    t.integer "pid", :default => 0, :null => false
  end

  add_index "contract_parameter_group", ["gid"], :name => "gid"

  create_table "contract_parameter_group_name", :force => true do |t|
    t.string "title", :limit => 150, :default => "0", :null => false
  end

  create_table "contract_parameter_type_1", :id => false, :force => true do |t|
    t.integer "cid", :default => 0,  :null => false
    t.integer "pid", :default => 0,  :null => false
    t.string  "val", :default => "", :null => false
  end

  create_table "contract_parameter_type_1_log", :id => false, :force => true do |t|
    t.integer  "cid",       :default => 0, :null => false
    t.integer  "pid",       :default => 0, :null => false
    t.string   "val"
    t.datetime "dt_change",                :null => false
    t.integer  "user_id",                  :null => false
  end

  add_index "contract_parameter_type_1_log", ["cid", "pid"], :name => "cid_pid"

  create_table "contract_parameter_type_2", :id => false, :force => true do |t|
    t.integer "cid",                      :default => 0,  :null => false
    t.integer "pid",                      :default => 0,  :null => false
    t.integer "hid"
    t.string  "flat",       :limit => 10
    t.string  "room",       :limit => 5,  :default => "", :null => false
    t.integer "pod",                      :default => 0
    t.integer "floor",                    :default => 0
    t.string  "address"
    t.string  "comment"
    t.string  "format_key", :limit => 50
  end

  add_index "contract_parameter_type_2", ["hid"], :name => "hid"

  create_table "contract_parameter_type_2_log", :id => false, :force => true do |t|
    t.integer  "cid",       :null => false
    t.integer  "pid",       :null => false
    t.string   "val"
    t.datetime "dt_change", :null => false
    t.integer  "user_id",   :null => false
  end

  add_index "contract_parameter_type_2_log", ["cid", "pid"], :name => "cid_pid"

  create_table "contract_parameter_type_3", :force => true do |t|
    t.integer "cid",                    :default => 0, :null => false
    t.integer "pid",                    :default => 0, :null => false
    t.string  "email",   :limit => 400
    t.string  "name"
    t.string  "comment"
  end

  add_index "contract_parameter_type_3", ["cid", "pid"], :name => "cid_pid", :unique => true

  create_table "contract_parameter_type_3_log", :id => false, :force => true do |t|
    t.integer  "cid",       :null => false
    t.integer  "pid",       :null => false
    t.string   "val"
    t.datetime "dt_change", :null => false
    t.integer  "user_id",   :null => false
  end

  add_index "contract_parameter_type_3_log", ["cid", "pid"], :name => "cid_pid"

  create_table "contract_parameter_type_3_mail", :id => false, :force => true do |t|
    t.integer "mailid", :default => 0, :null => false
    t.integer "eid",    :default => 0, :null => false
  end

  add_index "contract_parameter_type_3_mail", ["eid"], :name => "eid"
  add_index "contract_parameter_type_3_mail", ["mailid"], :name => "mailid"

  create_table "contract_parameter_type_4", :id => false, :force => true do |t|
    t.integer "cid",  :default => 0, :null => false
    t.integer "pid",  :default => 0, :null => false
    t.integer "val1", :default => 0, :null => false
    t.integer "val2", :default => 0, :null => false
  end

  add_index "contract_parameter_type_4", ["cid", "pid", "val1"], :name => "cid_pid_val1", :unique => true

  create_table "contract_parameter_type_4_directory", :force => true do |t|
    t.string "title", :limit => 150, :default => "0"
  end

  create_table "contract_parameter_type_4_log", :id => false, :force => true do |t|
    t.integer  "cid",       :null => false
    t.integer  "pid",       :null => false
    t.string   "val"
    t.datetime "dt_change", :null => false
    t.integer  "user_id",   :null => false
  end

  add_index "contract_parameter_type_4_log", ["cid", "pid"], :name => "cid_pid"

  create_table "contract_parameter_type_5", :id => false, :force => true do |t|
    t.integer "cid", :default => 0, :null => false
    t.integer "pid", :default => 0, :null => false
    t.integer "val", :default => 0, :null => false
  end

  create_table "contract_parameter_type_5_log", :id => false, :force => true do |t|
    t.integer  "cid",       :default => 0, :null => false
    t.integer  "pid",       :default => 0, :null => false
    t.integer  "val"
    t.datetime "dt_change",                :null => false
    t.integer  "user_id",   :default => 0, :null => false
  end

  add_index "contract_parameter_type_5_log", ["cid", "pid"], :name => "cid_pid"

  create_table "contract_parameter_type_6", :id => false, :force => true do |t|
    t.integer "cid", :default => 0, :null => false
    t.integer "pid", :default => 0, :null => false
    t.date    "val",                :null => false
  end

  create_table "contract_parameter_type_6_log", :id => false, :force => true do |t|
    t.integer  "cid",       :default => 0, :null => false
    t.integer  "pid",       :default => 0, :null => false
    t.date     "val"
    t.datetime "dt_change",                :null => false
    t.integer  "user_id",                  :null => false
  end

  add_index "contract_parameter_type_6_log", ["cid", "pid"], :name => "cid_pid"

  create_table "contract_parameter_type_7", :id => false, :force => true do |t|
    t.integer "cid",                         :default => 0, :null => false
    t.integer "pid",                         :default => 0, :null => false
    t.integer "val",                         :default => 0, :null => false
    t.string  "custom_value", :limit => 100,                :null => false
  end

  add_index "contract_parameter_type_7", ["cid", "pid"], :name => "cid_pid", :unique => true

  create_table "contract_parameter_type_7_log", :id => false, :force => true do |t|
    t.integer  "cid",                      :default => 0, :null => false
    t.integer  "pid",                      :default => 0, :null => false
    t.integer  "val"
    t.string   "title",     :limit => 100
    t.datetime "dt_change",                               :null => false
    t.integer  "user_id",                                 :null => false
  end

  add_index "contract_parameter_type_7_log", ["cid", "pid"], :name => "cid_pid"

  create_table "contract_parameter_type_7_values", :force => true do |t|
    t.integer "pid",                  :default => 0,  :null => false
    t.string  "title", :limit => 100, :default => "", :null => false
  end

  add_index "contract_parameter_type_7_values", ["pid"], :name => "pid"

  create_table "contract_parameter_type_8", :id => false, :force => true do |t|
    t.integer "cid", :default => 0, :null => false
    t.integer "pid", :default => 0, :null => false
    t.integer "val", :default => 0, :null => false
  end

  add_index "contract_parameter_type_8", ["cid", "pid"], :name => "cid_pid", :unique => true

  create_table "contract_parameter_type_8_log", :id => false, :force => true do |t|
    t.integer  "cid",       :default => 0, :null => false
    t.integer  "pid",       :default => 0, :null => false
    t.integer  "val"
    t.datetime "dt_change",                :null => false
    t.integer  "user_id",                  :null => false
  end

  add_index "contract_parameter_type_8_log", ["cid", "pid"], :name => "cid_pid"

  create_table "contract_parameter_type_9", :id => false, :force => true do |t|
    t.integer "pid",                         :null => false
    t.string  "value"
    t.string  "phone1",        :limit => 11
    t.string  "phone_format1", :limit => 2
    t.string  "phone_comm1",   :limit => 40
    t.string  "phone2",        :limit => 11
    t.string  "phone_format2", :limit => 2
    t.string  "phone_comm2",   :limit => 40
    t.string  "phone3",        :limit => 11
    t.string  "phone_format3", :limit => 2
    t.string  "phone_comm3",   :limit => 40
    t.string  "phone4",        :limit => 11
    t.string  "phone_format4", :limit => 2
    t.string  "phone_comm4",   :limit => 40
    t.string  "phone5",        :limit => 11
    t.string  "phone_format5", :limit => 2
    t.string  "phone_comm5",   :limit => 40
    t.integer "cid",                         :null => false
  end

  add_index "contract_parameter_type_9", ["cid", "pid"], :name => "cid_pid"

  create_table "contract_parameter_type_9_log", :id => false, :force => true do |t|
    t.integer  "cid",                         :null => false
    t.integer  "pid",                         :null => false
    t.string   "val"
    t.string   "phone1",        :limit => 11
    t.string   "phone_format1", :limit => 2
    t.string   "phone_comm1",   :limit => 40
    t.string   "phone2",        :limit => 11
    t.string   "phone_format2", :limit => 2
    t.string   "phone_comm2",   :limit => 40
    t.string   "phone3",        :limit => 11
    t.string   "phone_format3", :limit => 2
    t.string   "phone_comm3",   :limit => 40
    t.string   "phone4",        :limit => 11
    t.string   "phone_format4", :limit => 2
    t.string   "phone_comm4",   :limit => 40
    t.string   "phone5",        :limit => 11
    t.string   "phone_format5", :limit => 2
    t.string   "phone_comm5",   :limit => 40
    t.datetime "dt_change",                   :null => false
    t.integer  "user_id",                     :null => false
  end

  add_index "contract_parameter_type_9_log", ["cid", "pid"], :name => "cip_pid"

  create_table "contract_parameter_type_phone", :id => false, :force => true do |t|
    t.integer "pid",   :null => false
    t.integer "cid",   :null => false
    t.string  "value", :null => false
  end

  create_table "contract_parameter_type_phone_item", :id => false, :force => true do |t|
    t.integer "pid",                   :null => false
    t.integer "cid",                   :null => false
    t.integer "n",       :limit => 1,  :null => false
    t.string  "phone",   :limit => 14
    t.string  "format",  :limit => 2
    t.string  "comment"
  end

  add_index "contract_parameter_type_phone_item", ["phone"], :name => "phone"

  create_table "contract_parameter_type_phone_log", :id => false, :force => true do |t|
    t.integer  "pid",       :null => false
    t.integer  "cid",       :null => false
    t.string   "val"
    t.text     "data"
    t.datetime "dt_change", :null => false
    t.integer  "user_id",   :null => false
  end

  add_index "contract_parameter_type_phone_log", ["cid", "pid"], :name => "cid_pid"

  create_table "contract_parameters_pref", :force => true do |t|
    t.integer  "pt",                     :default => 0,  :null => false
    t.string   "title",   :limit => 100, :default => "", :null => false
    t.integer  "sort",                   :default => 0,  :null => false
    t.text     "script",                                 :null => false
    t.boolean  "history",                                :null => false
    t.datetime "lm",                                     :null => false
  end

  add_index "contract_parameters_pref", ["sort"], :name => "sort"

  create_table "contract_password_once", :id => false, :force => true do |t|
    t.timestamp "lu",                            :null => false
    t.datetime  "dt",                            :null => false
    t.string    "contract_title", :limit => 150, :null => false
    t.string    "password",       :limit => 64,  :null => false
  end

  add_index "contract_password_once", ["password"], :name => "password", :unique => true

  create_table "contract_pattern", :force => true do |t|
    t.string  "title",        :limit => 150, :default => "",  :null => false
    t.float   "closesumma",                  :default => 0.0, :null => false
    t.string  "tpid",         :limit => 250,                  :null => false
    t.integer "groups",       :limit => 8,   :default => 0,   :null => false
    t.integer "mode",                        :default => 0,   :null => false
    t.integer "pgid",                        :default => 0,   :null => false
    t.integer "pfid",                        :default => 0,   :null => false
    t.integer "fc",           :limit => 1,   :default => 0,   :null => false
    t.integer "dtl",                         :default => 0,   :null => false
    t.string  "tgid",         :limit => 250,                  :null => false
    t.string  "scrid",        :limit => 250,                  :null => false
    t.string  "name_pattern", :limit => 200, :default => "",  :null => false
    t.binary  "data"
    t.integer "patid",                       :default => 0,   :null => false
  end

  create_table "contract_pattern_modules", :id => false, :force => true do |t|
    t.integer "pid", :null => false
    t.integer "mid", :null => false
  end

  create_table "contract_pattern_services", :id => false, :force => true do |t|
    t.integer "pid", :default => 0, :null => false
    t.integer "sid", :default => 0, :null => false
  end

  add_index "contract_pattern_services", ["pid"], :name => "pid"

  create_table "contract_payment", :force => true do |t|
    t.date      "dt",                                                                    :null => false
    t.integer   "cid",                                                   :default => 0,  :null => false
    t.integer   "pt",                                                    :default => 0,  :null => false
    t.integer   "uid",                                                   :default => 0,  :null => false
    t.decimal   "summa",                  :precision => 10, :scale => 2,                 :null => false
    t.string    "comment", :limit => 200,                                :default => "", :null => false
    t.timestamp "lm",                                                                    :null => false
  end

  add_index "contract_payment", ["cid", "dt"], :name => "cid_dt"
  add_index "contract_payment", ["dt", "cid"], :name => "dt_cid"
  add_index "contract_payment", ["pt", "dt"], :name => "pt_dt"
  add_index "contract_payment", ["uid"], :name => "uid"

  create_table "contract_payment_types", :force => true do |t|
    t.string  "title", :limit => 50, :default => "", :null => false
    t.integer "up",                  :default => 0,  :null => false
    t.integer "type",  :limit => 1,  :default => 0,  :null => false
    t.integer "flag",  :limit => 1,  :default => 0,  :null => false
  end

  add_index "contract_payment_types", ["flag"], :name => "flag"
  add_index "contract_payment_types", ["type"], :name => "type"
  add_index "contract_payment_types", ["up"], :name => "up"

  create_table "contract_script", :force => true do |t|
    t.integer "cid",                      :default => 0,  :null => false
    t.date    "date1"
    t.date    "date2"
    t.integer "script_id",                :default => 0,  :null => false
    t.string  "comment",   :limit => 200, :default => "", :null => false
  end

  add_index "contract_script", ["cid"], :name => "cid"

  create_table "contract_service", :force => true do |t|
    t.integer "cid",     :default => 0,  :null => false
    t.integer "sid",     :default => 0,  :null => false
    t.date    "date1"
    t.date    "date2"
    t.string  "comment", :default => "", :null => false
    t.date    "lm",                      :null => false
    t.integer "emid",    :default => 0,  :null => false
    t.integer "eid",     :default => 0,  :null => false
  end

  add_index "contract_service", ["cid"], :name => "cid"
  add_index "contract_service", ["date1"], :name => "date1"
  add_index "contract_service", ["date2"], :name => "date2"
  add_index "contract_service", ["sid"], :name => "sid"

  create_table "contract_status", :force => true do |t|
    t.integer "cid",                    :null => false
    t.integer "status",  :limit => 1,   :null => false
    t.integer "uid",                    :null => false
    t.date    "date1",                  :null => false
    t.date    "date2"
    t.string  "comment", :limit => 250, :null => false
  end

  add_index "contract_status", ["cid"], :name => "cid"

  create_table "contract_status_balance_dump", :id => false, :force => true do |t|
    t.integer "cid",                                             :default => 0, :null => false
    t.integer "mm",  :limit => 8
    t.decimal "yy",               :precision => 16, :scale => 0
  end

  add_index "contract_status_balance_dump", ["cid"], :name => "cid", :unique => true

  create_table "contract_status_log", :force => true do |t|
    t.integer  "status",  :limit => 1,                  :null => false
    t.integer  "uid",                                   :null => false
    t.datetime "date",                                  :null => false
    t.string   "comment", :limit => 250,                :null => false
    t.integer  "cid",                    :default => 0, :null => false
    t.date     "date1",                                 :null => false
    t.date     "date2"
  end

  create_table "contract_tariff", :force => true do |t|
    t.integer  "cid",                        :default => 0,  :null => false
    t.integer  "tpid",                       :default => 0,  :null => false
    t.date     "date1"
    t.date     "date2"
    t.string   "comment",                    :default => "", :null => false
    t.datetime "lm",                                         :null => false
    t.integer  "pos",           :limit => 1, :default => 0,  :null => false
    t.integer  "emid",                       :default => 0,  :null => false
    t.integer  "eid",                        :default => 0,  :null => false
    t.integer  "replaced_from"
  end

  add_index "contract_tariff", ["cid"], :name => "cid"

  create_table "contract_tariff_group", :force => true do |t|
    t.integer "cid",                    :default => 0,  :null => false
    t.date    "date1"
    t.date    "date2"
    t.integer "gid",                    :default => 0,  :null => false
    t.string  "comment", :limit => 200, :default => "", :null => false
  end

  add_index "contract_tariff_group", ["cid"], :name => "cid"

  create_table "contract_tariff_option", :force => true do |t|
    t.integer  "uid",                                             :null => false
    t.integer  "cid",                                             :null => false
    t.integer  "option_id",                                       :null => false
    t.datetime "time_from",                                       :null => false
    t.datetime "time_to"
    t.integer  "charge_id",                                       :null => false
    t.decimal  "summa",            :precision => 10, :scale => 2, :null => false
    t.integer  "activated_mode",                                  :null => false
    t.datetime "activated_time",                                  :null => false
    t.datetime "deactivated_time"
  end

  add_index "contract_tariff_option", ["cid"], :name => "cid"

  create_table "contract_tree_link", :force => true do |t|
    t.integer "cid",                    :default => 0,  :null => false
    t.integer "tree_id",                :default => 0,  :null => false
    t.string  "title",   :limit => 200, :default => "", :null => false
    t.date    "date1"
    t.date    "date2"
    t.integer "pos",     :limit => 1,   :default => 0,  :null => false
    t.integer "emid",                   :default => 0,  :null => false
    t.integer "eid",                    :default => 0,  :null => false
  end

  add_index "contract_tree_link", ["cid"], :name => "cid"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "entity", :force => true do |t|
    t.integer "entitySpecId", :null => false
    t.string  "title",        :null => false
  end

  create_table "entity_attr_address", :id => false, :force => true do |t|
    t.integer "entityId",                                       :null => false
    t.integer "entitySpecAttrId",                               :null => false
    t.integer "houseId"
    t.string  "flat",             :limit => 10
    t.string  "room",             :limit => 5,  :default => "", :null => false
    t.integer "pod"
    t.integer "floor"
    t.string  "value"
    t.string  "comment"
    t.string  "format_key",       :limit => 45, :default => ""
  end

  create_table "entity_attr_date", :id => false, :force => true do |t|
    t.integer "entityId",         :null => false
    t.integer "entitySpecAttrId", :null => false
    t.date    "value",            :null => false
  end

  create_table "entity_attr_house", :id => false, :force => true do |t|
    t.integer "entityId",         :null => false
    t.integer "entitySpecAttrId", :null => false
    t.integer "value",            :null => false
  end

  create_table "entity_attr_int", :id => false, :force => true do |t|
    t.integer "entityId",         :null => false
    t.integer "entitySpecAttrId", :null => false
    t.integer "value",            :null => false
  end

  create_table "entity_attr_list", :id => false, :force => true do |t|
    t.integer "entityId",         :null => false
    t.integer "entitySpecAttrId", :null => false
    t.integer "value",            :null => false
  end

  create_table "entity_attr_text", :id => false, :force => true do |t|
    t.integer "entityId",         :null => false
    t.integer "entitySpecAttrId", :null => false
    t.string  "value",            :null => false
  end

  create_table "entity_spec", :force => true do |t|
    t.string  "title",                                            :null => false
    t.integer "entitySpecTypeId",                                 :null => false
    t.text    "comment",                                          :null => false
    t.integer "hidden",                                           :null => false
    t.string  "entityTitleMacros", :limit => 100, :default => "", :null => false
  end

  add_index "entity_spec", ["entitySpecTypeId"], :name => "entity_type_id"

  create_table "entity_spec_attr", :force => true do |t|
    t.string  "title",   :null => false
    t.integer "type",    :null => false
    t.text    "comment", :null => false
  end

  create_table "entity_spec_attr_link", :id => false, :force => true do |t|
    t.integer "entitySpecId",     :null => false
    t.integer "entitySpecAttrId", :null => false
    t.integer "pos",              :null => false
  end

  add_index "entity_spec_attr_link", ["entitySpecId"], :name => "entity_spec_id"

  create_table "entity_spec_attr_list", :force => true do |t|
    t.integer "entitySpecAttrId", :null => false
    t.string  "title",            :null => false
  end

  add_index "entity_spec_attr_list", ["entitySpecAttrId"], :name => "entity_spec_attr_id"

  create_table "entity_spec_type", :force => true do |t|
    t.string "title", :null => false
    t.string "type",  :null => false
  end

  create_table "event_script_link", :force => true do |t|
    t.string  "title",      :null => false
    t.string  "class_name", :null => false
    t.string  "event_key",  :null => false
    t.integer "script_id",  :null => false
  end

  create_table "filestorage_files_list_7", :force => true do |t|
    t.integer   "id_owner", :null => false
    t.string    "title",    :null => false
    t.integer   "size",     :null => false
    t.timestamp "date",     :null => false
    t.integer   "user",     :null => false
    t.text      "comment",  :null => false
  end

  create_table "firm", :force => true do |t|
    t.string "title", :limit => 150, :default => "0", :null => false
  end

  create_table "global_script", :force => true do |t|
    t.string    "title"
    t.text      "script"
    t.integer   "user_id",     :null => false
    t.timestamp "change_time", :null => false
  end

  create_table "global_script_link", :force => true do |t|
    t.string "title",      :null => false
    t.string "class_name", :null => false
  end

  create_table "helpdesk_category_10", :force => true do |t|
    t.string "title", :limit => 200, :null => false
  end

  create_table "helpdesk_directory_link_10", :force => true do |t|
    t.integer "group",       :null => false
    t.integer "category",    :null => false
    t.integer "subcategory", :null => false
  end

  create_table "helpdesk_group_10", :force => true do |t|
    t.string "title", :limit => 200, :null => false
  end

  create_table "helpdesk_message_10", :force => true do |t|
    t.integer  "topic_id",                 :null => false
    t.text     "body",                     :null => false
    t.datetime "date_from",                :null => false
    t.integer  "user_from",                :null => false
    t.datetime "date_to"
    t.integer  "user_to",                  :null => false
    t.string   "comment",   :limit => 250, :null => false
  end

  add_index "helpdesk_message_10", ["topic_id"], :name => "topic_id"
  add_index "helpdesk_message_10", ["user_from", "user_to"], :name => "from_to"

  create_table "helpdesk_package_10", :force => true do |t|
    t.timestamp "lu",                                                        :null => false
    t.string    "title",                                                     :null => false
    t.decimal   "summa",     :precision => 12, :scale => 2, :default => 1.0, :null => false
    t.integer   "count",                                    :default => 1,   :null => false
    t.integer   "period",                                   :default => 1,   :null => false
    t.integer   "status",                                   :default => 0,   :null => false
    t.integer   "charge_id",                                :default => 0,   :null => false
  end

  create_table "helpdesk_package_contract_10", :force => true do |t|
    t.timestamp "lu",                                        :null => false
    t.integer   "package_id",                                :null => false
    t.integer   "cid",                                       :null => false
    t.date      "date_from",                                 :null => false
    t.date      "date_to",                                   :null => false
    t.decimal   "summa",      :precision => 15, :scale => 2, :null => false
    t.integer   "count",                                     :null => false
    t.integer   "count_use",                                 :null => false
    t.integer   "user_id",                                   :null => false
  end

  create_table "helpdesk_param_10", :id => false, :force => true do |t|
    t.integer "cid",                 :null => false
    t.string  "name",  :limit => 50, :null => false
    t.string  "value",               :null => false
  end

  add_index "helpdesk_param_10", ["cid"], :name => "cid"

  create_table "helpdesk_subcategory_10", :force => true do |t|
    t.string "title", :limit => 200, :null => false
  end

  create_table "helpdesk_topic_10", :force => true do |t|
    t.string   "title",                                                                             :null => false
    t.integer  "cid",                                                                               :null => false
    t.integer  "charge_id",                                                                         :null => false
    t.decimal  "cost",                             :precision => 7, :scale => 2,                    :null => false
    t.boolean  "closed",                                                         :default => false, :null => false
    t.datetime "date",                                                                              :null => false
    t.datetime "date_close"
    t.integer  "comm",                :limit => 1,                               :default => 0,     :null => false
    t.string   "comm_value",                                                     :default => "",    :null => false
    t.integer  "user_id",                                                        :default => -1,    :null => false
    t.integer  "status",              :limit => 2,                               :default => 0,     :null => false
    t.integer  "contract_package_id",                                            :default => -1,    :null => false
    t.boolean  "autoclose",                                                      :default => true,  :null => false
    t.integer  "category_id",                                                                       :null => false
    t.integer  "subcategory_id",                                                                    :null => false
  end

  create_table "helpdesk_topic_manager_change_10", :id => false, :force => true do |t|
    t.integer  "topic_id", :null => false
    t.integer  "user_id",  :null => false
    t.datetime "date",     :null => false
    t.text     "comment"
  end

  create_table "helpdesk_topic_statuses_10", :force => true do |t|
    t.string "title", :limit => 128, :null => false
  end

  create_table "inet_accounting_period_14", :force => true do |t|
    t.integer "contractId",                :null => false
    t.date    "dateFrom",                  :null => false
    t.date    "dateTo",                    :null => false
    t.integer "userId",     :default => 0, :null => false
  end

  add_index "inet_accounting_period_14", ["contractId"], :name => "contract"

  create_table "inet_connection_14", :id => false, :force => true do |t|
    t.integer  "id",               :limit => 8,                  :null => false
    t.integer  "parentId",         :limit => 8,                  :null => false
    t.integer  "deviceId",                                       :null => false
    t.integer  "devicePort",                                     :null => false
    t.integer  "agentDeviceId",                   :default => 0, :null => false
    t.string   "acctSessionId",    :limit => 80
    t.string   "username",         :limit => 40
    t.integer  "type",                                           :null => false
    t.integer  "accessCode",       :limit => 2,                  :null => false
    t.integer  "servId",                                         :null => false
    t.string   "calledStationId",  :limit => 50
    t.string   "callingStationId", :limit => 50
    t.integer  "ipResourceId",                                   :null => false
    t.binary   "ipAddress",        :limit => 24
    t.datetime "connectionStart",                                :null => false
    t.integer  "deviceState",      :limit => 2,   :default => 1, :null => false
    t.string   "deviceOptions",    :limit => 250,                :null => false
    t.integer  "status",           :limit => 2,                  :null => false
  end

  add_index "inet_connection_14", ["connectionStart"], :name => "connectionStart"
  add_index "inet_connection_14", ["deviceId", "devicePort"], :name => "nas"
  add_index "inet_connection_14", ["id"], :name => "id"
  add_index "inet_connection_14", ["ipAddress"], :name => "ipAddress"
  add_index "inet_connection_14", ["parentId"], :name => "parent"
  add_index "inet_connection_14", ["servId"], :name => "serv"

  create_table "inet_connection_route_14", :force => true do |t|
    t.integer "connectionId", :limit => 8,  :null => false
    t.binary  "subnet",       :limit => 24, :null => false
    t.integer "mask",                       :null => false
  end

  add_index "inet_connection_route_14", ["connectionId"], :name => "connectionId"

  create_table "inet_device_14", :force => true do |t|
    t.integer  "entityId",                    :null => false
    t.integer  "parentId",                    :null => false
    t.integer  "deviceTypeId",                :null => false
    t.string   "title",        :limit => 250, :null => false
    t.string   "identifier",   :limit => 150, :null => false
    t.text     "uptime",                      :null => false
    t.datetime "uptimeTime"
    t.string   "host",         :limit => 150, :null => false
    t.string   "username",     :limit => 100, :null => false
    t.string   "password",     :limit => 100, :null => false
    t.string   "secret",       :limit => 100, :null => false
    t.text     "config",                      :null => false
    t.text     "comment",                     :null => false
  end

  create_table "inet_device_type_14", :force => true do |t|
    t.string  "title",                :limit => 250,                    :null => false
    t.integer "configId",                                               :null => false
    t.text    "config",                                                 :null => false
    t.string  "protocolHandlerClass", :limit => 250
    t.string  "saHandlerClass",       :limit => 250
    t.string  "deviceManagerClass",   :limit => 250
    t.integer "scriptId",                                               :null => false
    t.text    "saScript"
    t.text    "eventScript"
    t.string  "comment",              :limit => 250,                    :null => false
    t.boolean "source",                              :default => false
    t.integer "deviceEntitySpecId",                  :default => 0,     :null => false
  end

  create_table "inet_interface_14", :id => false, :force => true do |t|
    t.integer "id",                          :null => false
    t.string  "title",        :limit => 100, :null => false
    t.integer "deviceTypeId",                :null => false
  end

  add_index "inet_interface_14", ["deviceTypeId"], :name => "deviceTypeId"

  create_table "inet_option_14", :force => true do |t|
    t.integer "parentId",                         :null => false
    t.string  "title",             :limit => 150, :null => false
    t.integer "groupIntersection", :limit => 1,   :null => false
    t.text    "config",                           :null => false
    t.text    "comment",                          :null => false
  end

  create_table "inet_serv_14", :force => true do |t|
    t.integer "parentId",                                                :null => false
    t.integer "contractId",                                              :null => false
    t.integer "typeId",                                                  :null => false
    t.integer "deviceId",                                                :null => false
    t.integer "interfaceId",                                             :null => false
    t.integer "vlan",                                    :default => -1, :null => false
    t.binary  "macAddress",               :limit => 64
    t.integer "ipResourceId"
    t.integer "ipResourceSubscriptionId",                                :null => false
    t.binary  "addressFrom",              :limit => 24
    t.binary  "addressTo",                :limit => 24
    t.string  "login",                    :limit => 30,                  :null => false
    t.string  "password",                 :limit => 30
    t.date    "dateFrom"
    t.date    "dateTo"
    t.integer "status",                                                  :null => false
    t.integer "sessionCountLimit",                                       :null => false
    t.integer "deviceState",                                             :null => false
    t.integer "accessCode",                                              :null => false
    t.string  "config"
    t.string  "deviceOptions",            :limit => 200,                 :null => false
    t.string  "comment",                  :limit => 250,                 :null => false
    t.string  "title"
  end

  add_index "inet_serv_14", ["contractId"], :name => "contractId"
  add_index "inet_serv_14", ["deviceId"], :name => "deviceId"
  add_index "inet_serv_14", ["login"], :name => "login"
  add_index "inet_serv_14", ["parentId"], :name => "parentId"

  create_table "inet_serv_option_14", :id => false, :force => true do |t|
    t.integer "servId",   :null => false
    t.integer "optionId", :null => false
    t.date    "dateFrom"
    t.date    "dateTo"
  end

  add_index "inet_serv_option_14", ["servId", "optionId"], :name => "servOptIdx"

  create_table "inet_serv_type_14", :force => true do |t|
    t.string  "title",                 :limit => 150,                 :null => false
    t.string  "parentTypeIds",         :limit => 45,  :default => "", :null => false
    t.integer "sessionInitiationType", :limit => 1,                   :null => false
    t.integer "sessionCountLimit",                                    :null => false
    t.integer "sessionCountLimitLock", :limit => 1,   :default => 0,  :null => false
    t.integer "addressType",           :limit => 1,                   :null => false
    t.integer "trafficTypeLinkId",                                    :null => false
    t.integer "needLogin",             :limit => 1,                   :null => false
    t.integer "needDevice",            :limit => 1,                   :null => false
    t.integer "needInterface",         :limit => 1,                   :null => false
    t.integer "personalInterface",     :limit => 1,   :default => 1,  :null => false
    t.integer "needVlan",              :limit => 1,                   :null => false
    t.integer "needMacAddress",        :limit => 1,   :default => 0,  :null => false
    t.text    "config"
    t.integer "personalVlan",          :limit => 1,   :default => 1,  :null => false
  end

  create_table "inet_serv_type_device_group_link_14", :id => false, :force => true do |t|
    t.integer "inetServId",    :null => false
    t.integer "deviceGroupId", :null => false
  end

  add_index "inet_serv_type_device_group_link_14", ["inetServId"], :name => "inetServId"

  create_table "inet_serv_type_device_type_link_14", :id => false, :force => true do |t|
    t.integer "inetServId",   :null => false
    t.integer "deviceTypeId", :null => false
  end

  add_index "inet_serv_type_device_type_link_14", ["inetServId"], :name => "inetServId"

  create_table "inet_session_14", :id => false, :force => true do |t|
    t.integer  "id",           :limit => 8,                                               :null => false
    t.integer  "parentId",     :limit => 8,                                               :null => false
    t.integer  "splittedId",   :limit => 8,                                               :null => false
    t.integer  "connectionId", :limit => 8,                                               :null => false
    t.datetime "sessionStart",                                                            :null => false
    t.datetime "sessionStop"
    t.datetime "lastActive",                                                              :null => false
    t.integer  "sessionTime",  :limit => 8,                                               :null => false
    t.decimal  "sessionCost",               :precision => 12, :scale => 5,                :null => false
    t.integer  "deviceState",  :limit => 2,                                :default => 1, :null => false
    t.integer  "status",       :limit => 2,                                               :null => false
  end

  add_index "inet_session_14", ["connectionId"], :name => "connectionId"
  add_index "inet_session_14", ["id"], :name => "id"
  add_index "inet_session_14", ["parentId"], :name => "parentId"
  add_index "inet_session_14", ["sessionStart"], :name => "start"

  create_table "inet_session_account_14", :id => false, :force => true do |t|
    t.integer "contractId",                                             :null => false
    t.integer "sessionId",  :limit => 8,                                :null => false
    t.integer "serviceId",                                              :null => false
    t.integer "amount",     :limit => 8,                                :null => false
    t.decimal "account",                 :precision => 10, :scale => 5, :null => false
  end

  add_index "inet_session_account_14", ["serviceId"], :name => "serviceId"
  add_index "inet_session_account_14", ["sessionId"], :name => "sessionId"

  create_table "inet_session_detail_14", :id => false, :force => true do |t|
    t.integer "sessionId",     :limit => 8, :null => false
    t.integer "day",           :limit => 1, :null => false
    t.integer "hour",          :limit => 1, :null => false
    t.integer "trafficTypeId",              :null => false
    t.integer "deviceId",                   :null => false
    t.integer "amount",        :limit => 8, :null => false
  end

  add_index "inet_session_detail_14", ["sessionId"], :name => "sessionId"

  create_table "inet_session_sequence_14", :id => false, :force => true do |t|
    t.integer "id", :limit => 8, :null => false
  end

  create_table "inet_tariff_traffic_max_14", :id => false, :force => true do |t|
    t.integer "contractId",              :null => false
    t.integer "treeNodeId", :limit => 8, :null => false
    t.integer "maxKey",     :limit => 8, :null => false
    t.integer "counter",                 :null => false
    t.integer "yy",                      :null => false
    t.integer "mm",                      :null => false
    t.integer "amountMax",  :limit => 8, :null => false
    t.integer "amount1",    :limit => 8, :null => false
    t.integer "amount2",    :limit => 8, :null => false
  end

  create_table "inet_tariff_traffic_range_14", :id => false, :force => true do |t|
    t.integer "contractId",              :null => false
    t.integer "treeNodeId", :limit => 8, :null => false
    t.integer "rangeKey",   :limit => 8, :null => false
    t.integer "amount",     :limit => 8, :null => false
    t.integer "counter",                 :null => false
    t.integer "yy",                      :null => false
    t.integer "mm",                      :null => false
  end

  create_table "inet_task_process_14", :force => true do |t|
    t.integer  "deviceId",   :null => false
    t.datetime "day",        :null => false
    t.datetime "startTime"
    t.integer  "curentHour", :null => false
  end

  create_table "inet_traffic_type_14", :force => true do |t|
    t.string "title", :limit => 150, :null => false
  end

  create_table "inet_traffic_type_link_14", :force => true do |t|
    t.string "title", :limit => 150, :null => false
  end

  create_table "inet_traffic_type_link_rule_14", :force => true do |t|
    t.integer "linkId",                                        :null => false
    t.integer "position",                                      :null => false
    t.date    "dateFrom"
    t.date    "dateTo"
    t.integer "type",                                          :null => false
    t.integer "sourceId",                      :default => 0,  :null => false
    t.integer "interfaceId",                   :default => -1, :null => false
    t.integer "direction",                                     :null => false
    t.binary  "addressFrom",    :limit => 24
    t.binary  "addressTo",      :limit => 24
    t.integer "portFrom",                                      :null => false
    t.integer "portTo",                                        :null => false
    t.string  "diffServ",       :limit => 50
    t.string  "counterRealm",   :limit => 35,  :default => "", :null => false
    t.string  "counterService", :limit => 100,                 :null => false
    t.integer "counterVendor",                                 :null => false
    t.integer "counterType",                                   :null => false
    t.string  "counterPrefix",  :limit => 50
    t.integer "trafficTypeId",                                 :null => false
    t.text    "comment",                                       :null => false
  end

  create_table "inet_zone_14", :force => true do |t|
    t.string "title", :limit => 150, :null => false
  end

  create_table "inv_device_group_14", :force => true do |t|
    t.integer "parentId", :null => false
    t.string  "title",    :null => false
    t.integer "cityId",   :null => false
    t.text    "comment",  :null => false
  end

  add_index "inv_device_group_14", ["cityId"], :name => "city_id"
  add_index "inv_device_group_14", ["parentId"], :name => "parent_id"

  create_table "inv_device_group_link_14", :id => false, :force => true do |t|
    t.integer "deviceId",      :null => false
    t.integer "deviceGroupId", :null => false
  end

  add_index "inv_device_group_link_14", ["deviceId", "deviceGroupId"], :name => "device_id"

  create_table "inv_device_port_14", :id => false, :force => true do |t|
    t.integer "deviceId",                     :null => false
    t.integer "port",                         :null => false
    t.integer "status",                       :null => false
    t.integer "ipCategoryId",                 :null => false
    t.string  "comment",      :default => "", :null => false
  end

  add_index "inv_device_port_14", ["deviceId", "port"], :name => "device_port"

  create_table "inv_device_port_subscription_14", :force => true do |t|
    t.integer "deviceId",        :null => false
    t.integer "port",            :null => false
    t.date    "dateFrom"
    t.date    "dateTo"
    t.integer "subscriberId",    :null => false
    t.string  "subscriberTitle"
  end

  create_table "inv_ip_category_14", :force => true do |t|
    t.integer "parentId", :null => false
    t.string  "title",    :null => false
  end

  add_index "inv_ip_category_14", ["parentId"], :name => "parent"

  create_table "inv_ip_resource_14", :force => true do |t|
    t.integer "categoryId",                 :null => false
    t.binary  "addressFrom", :limit => 24,  :null => false
    t.binary  "addressTo",   :limit => 24,  :null => false
    t.date    "dateFrom"
    t.date    "dateTo"
    t.string  "router",      :limit => 150, :null => false
    t.string  "subnetMask",  :limit => 150, :null => false
    t.string  "dns",         :limit => 150, :null => false
    t.text    "comment",                    :null => false
    t.boolean "dynamic"
    t.text    "config",                     :null => false
  end

  add_index "inv_ip_resource_14", ["categoryId", "addressFrom", "addressTo"], :name => "ip"
  add_index "inv_ip_resource_14", ["dateFrom", "dateTo"], :name => "period"

  create_table "inv_ip_resource_dyn_reserve_14", :id => false, :force => true do |t|
    t.binary  "address",      :limit => 24, :null => false
    t.integer "timeout",      :limit => 8,  :null => false
    t.integer "ipResourceId",               :null => false
  end

  add_index "inv_ip_resource_dyn_reserve_14", ["timeout"], :name => "timeout"

  create_table "inv_ip_resource_subscription_14", :force => true do |t|
    t.integer "subscriberId",                  :null => false
    t.integer "ipResourceId",                  :null => false
    t.binary  "addressFrom",     :limit => 24, :null => false
    t.binary  "addressTo",       :limit => 24, :null => false
    t.date    "dateFrom"
    t.date    "dateTo"
    t.string  "subscriberTitle",               :null => false
  end

  create_table "inv_vlan_category_14", :force => true do |t|
    t.integer "parentId", :null => false
    t.string  "title",    :null => false
  end

  add_index "inv_vlan_category_14", ["parentId"], :name => "parent"

  create_table "inv_vlan_resource_14", :force => true do |t|
    t.string  "title",      :null => false
    t.integer "vlanFrom",   :null => false
    t.integer "vlanTo",     :null => false
    t.date    "dateFrom"
    t.date    "dateTo"
    t.text    "comment",    :null => false
    t.integer "categoryId", :null => false
  end

  create_table "inv_vlan_resource_subscription_14", :force => true do |t|
    t.integer "vlanResId",                      :null => false
    t.integer "vlan",                           :null => false
    t.date    "dateFrom"
    t.date    "dateTo"
    t.integer "subscriberId",                   :null => false
    t.string  "subscriberTitle", :limit => 100, :null => false
  end

  add_index "inv_vlan_resource_subscription_14", ["dateFrom", "dateTo"], :name => "period"
  add_index "inv_vlan_resource_subscription_14", ["subscriberId"], :name => "subscriber"
  add_index "inv_vlan_resource_subscription_14", ["vlanResId", "vlan"], :name => "vlan"

  create_table "ipn_gate_address_7", :primary_key => "gid", :force => true do |t|
    t.integer "id",                                   :null => false
    t.integer "hid"
    t.integer "pod",                   :default => 0
    t.integer "floor",                 :default => 0
    t.string  "address"
    t.string  "frac",    :limit => 35
  end

  add_index "ipn_gate_address_7", ["id"], :name => "id"

  create_table "ipn_gate_contract_port_7", :force => true do |t|
    t.integer "gid",  :null => false
    t.integer "cid",  :null => false
    t.integer "port", :null => false
  end

  add_index "ipn_gate_contract_port_7", ["cid"], :name => "cid_index"
  add_index "ipn_gate_contract_port_7", ["gid"], :name => "gid_index"

  create_table "ipn_gate_rule_7", :force => true do |t|
    t.integer "gtid", :null => false
    t.integer "rtid", :null => false
  end

  create_table "ipn_gate_vlan_7", :force => true do |t|
    t.integer "vid", :null => false
    t.integer "cid", :null => false
    t.integer "gid", :null => false
  end

  create_table "ipn_user_gate_rule_log_7", :force => true do |t|
    t.integer  "rtid",    :null => false
    t.datetime "date",    :null => false
    t.integer  "user_id", :null => false
    t.integer  "cid",     :null => false
    t.integer  "gid",     :null => false
  end

  create_table "log_contract_face", :id => false, :force => true do |t|
    t.datetime "dt",                   :null => false
    t.integer  "uid",   :default => 0, :null => false
    t.integer  "value", :default => 0, :null => false
    t.integer  "cid",   :default => 0, :null => false
  end

  create_table "log_contract_limit", :id => false, :force => true do |t|
    t.datetime "dt",                                                                   :null => false
    t.integer  "uid",                                                   :default => 0, :null => false
    t.decimal  "nvalue",                 :precision => 10, :scale => 2,                :null => false
    t.integer  "cid",                                                   :default => 0, :null => false
    t.string   "comment", :limit => 250,                                               :null => false
    t.string   "days",    :limit => 4
  end

  add_index "log_contract_limit", ["cid"], :name => "cid"

  create_table "log_contract_limit_manage_mode", :id => false, :force => true do |t|
    t.datetime "dt",                  :null => false
    t.integer  "uid",  :default => 0, :null => false
    t.integer  "mode", :default => 0, :null => false
    t.integer  "cid",  :default => 0, :null => false
  end

  add_index "log_contract_limit_manage_mode", ["cid"], :name => "cid"

  create_table "log_contract_mode", :id => false, :force => true do |t|
    t.datetime "dt",                   :null => false
    t.integer  "uid",   :default => 0, :null => false
    t.integer  "value", :default => 0, :null => false
    t.integer  "cid",   :default => 0, :null => false
  end

  create_table "log_contract_pswd", :id => false, :force => true do |t|
    t.datetime "dt",                 :null => false
    t.integer  "uid", :default => 0, :null => false
    t.integer  "cid", :default => 0, :null => false
  end

  add_index "log_contract_pswd", ["cid"], :name => "cid"

  create_table "log_error_6_201009", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201010", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201011", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201012", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201101", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201102", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201103", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201104", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201105", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201106", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201107", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201108", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201109", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201110", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201111", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201112", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201201", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201202", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201203", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201204", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201205", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201206", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201207", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201208", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201209", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_error_6_201210", :id => false, :force => true do |t|
    t.datetime "dt"
    t.integer  "cid"
    t.integer  "lid"
    t.string   "login",      :limit => 50
    t.integer  "nas_id"
    t.string   "nas_port",   :limit => 30
    t.integer  "error_code",               :null => false
    t.integer  "log_rec_id",               :null => false
  end

  create_table "log_login_pswd", :id => false, :force => true do |t|
    t.datetime "dt",                 :null => false
    t.integer  "uid", :default => 0, :null => false
    t.integer  "mid", :default => 0, :null => false
    t.integer  "lid", :default => 0, :null => false
  end

  add_index "log_login_pswd", ["lid", "mid"], :name => "lid_mid"

  create_table "log_server_6_201009", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201010", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201011", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201012", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201101", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201102", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201103", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201104", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201105", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201106", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201107", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201108", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201109", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201110", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201111", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201112", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201201", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201202", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201203", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201204", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201205", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201206", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201207", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201208", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201209", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_server_6_201210", :force => true do |t|
    t.text "requests", :limit => 2147483647, :null => false
  end

  create_table "log_session_6_201009", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 10,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201009", ["from_number"], :name => "from_number"
  add_index "log_session_6_201009", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201009", ["lid"], :name => "lid"
  add_index "log_session_6_201009", ["nas_id"], :name => "nas"
  add_index "log_session_6_201009", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201009", ["session_start"], :name => "session_start"
  add_index "log_session_6_201009", ["status"], :name => "status"

  create_table "log_session_6_201010", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 10,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201010", ["from_number"], :name => "from_number"
  add_index "log_session_6_201010", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201010", ["lid"], :name => "lid"
  add_index "log_session_6_201010", ["nas_id"], :name => "nas"
  add_index "log_session_6_201010", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201010", ["session_start"], :name => "session_start"
  add_index "log_session_6_201010", ["status"], :name => "status"

  create_table "log_session_6_201011", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 10,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201011", ["from_number"], :name => "from_number"
  add_index "log_session_6_201011", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201011", ["lid"], :name => "lid"
  add_index "log_session_6_201011", ["nas_id"], :name => "nas"
  add_index "log_session_6_201011", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201011", ["session_start"], :name => "session_start"
  add_index "log_session_6_201011", ["status"], :name => "status"

  create_table "log_session_6_201012", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 10,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201012", ["from_number"], :name => "from_number"
  add_index "log_session_6_201012", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201012", ["lid"], :name => "lid"
  add_index "log_session_6_201012", ["nas_id"], :name => "nas"
  add_index "log_session_6_201012", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201012", ["session_start"], :name => "session_start"
  add_index "log_session_6_201012", ["status"], :name => "status"

  create_table "log_session_6_201101", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 10,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201101", ["from_number"], :name => "from_number"
  add_index "log_session_6_201101", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201101", ["lid"], :name => "lid"
  add_index "log_session_6_201101", ["nas_id"], :name => "nas"
  add_index "log_session_6_201101", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201101", ["session_start"], :name => "session_start"
  add_index "log_session_6_201101", ["status"], :name => "status"

  create_table "log_session_6_201102", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 10,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201102", ["from_number"], :name => "from_number"
  add_index "log_session_6_201102", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201102", ["lid"], :name => "lid"
  add_index "log_session_6_201102", ["nas_id"], :name => "nas"
  add_index "log_session_6_201102", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201102", ["session_start"], :name => "session_start"
  add_index "log_session_6_201102", ["status"], :name => "status"

  create_table "log_session_6_201103", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 10,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201103", ["from_number"], :name => "from_number"
  add_index "log_session_6_201103", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201103", ["lid"], :name => "lid"
  add_index "log_session_6_201103", ["nas_id"], :name => "nas"
  add_index "log_session_6_201103", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201103", ["session_start"], :name => "session_start"
  add_index "log_session_6_201103", ["status"], :name => "status"

  create_table "log_session_6_201104", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201104", ["from_number"], :name => "from_number"
  add_index "log_session_6_201104", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201104", ["lid"], :name => "lid"
  add_index "log_session_6_201104", ["nas_id"], :name => "nas"
  add_index "log_session_6_201104", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201104", ["session_start"], :name => "session_start"
  add_index "log_session_6_201104", ["status"], :name => "status"

  create_table "log_session_6_201105", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201105", ["from_number"], :name => "from_number"
  add_index "log_session_6_201105", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201105", ["lid"], :name => "lid"
  add_index "log_session_6_201105", ["nas_id"], :name => "nas"
  add_index "log_session_6_201105", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201105", ["session_start"], :name => "session_start"
  add_index "log_session_6_201105", ["status"], :name => "status"

  create_table "log_session_6_201106", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201106", ["from_number"], :name => "from_number"
  add_index "log_session_6_201106", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201106", ["lid"], :name => "lid"
  add_index "log_session_6_201106", ["nas_id"], :name => "nas"
  add_index "log_session_6_201106", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201106", ["session_start"], :name => "session_start"
  add_index "log_session_6_201106", ["status"], :name => "status"

  create_table "log_session_6_201107", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201107", ["from_number"], :name => "from_number"
  add_index "log_session_6_201107", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201107", ["lid"], :name => "lid"
  add_index "log_session_6_201107", ["nas_id"], :name => "nas"
  add_index "log_session_6_201107", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201107", ["session_start"], :name => "session_start"
  add_index "log_session_6_201107", ["status"], :name => "status"

  create_table "log_session_6_201108", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201108", ["from_number"], :name => "from_number"
  add_index "log_session_6_201108", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201108", ["lid"], :name => "lid"
  add_index "log_session_6_201108", ["nas_id"], :name => "nas"
  add_index "log_session_6_201108", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201108", ["session_start"], :name => "session_start"
  add_index "log_session_6_201108", ["status"], :name => "status"

  create_table "log_session_6_201109", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201109", ["from_number"], :name => "from_number"
  add_index "log_session_6_201109", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201109", ["lid"], :name => "lid"
  add_index "log_session_6_201109", ["nas_id"], :name => "nas"
  add_index "log_session_6_201109", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201109", ["session_start"], :name => "session_start"
  add_index "log_session_6_201109", ["status"], :name => "status"

  create_table "log_session_6_201110", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201110", ["from_number"], :name => "from_number"
  add_index "log_session_6_201110", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201110", ["lid"], :name => "lid"
  add_index "log_session_6_201110", ["nas_id"], :name => "nas"
  add_index "log_session_6_201110", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201110", ["session_start"], :name => "session_start"
  add_index "log_session_6_201110", ["status"], :name => "status"

  create_table "log_session_6_201111", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201111", ["from_number"], :name => "from_number"
  add_index "log_session_6_201111", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201111", ["lid"], :name => "lid"
  add_index "log_session_6_201111", ["nas_id"], :name => "nas"
  add_index "log_session_6_201111", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201111", ["session_start"], :name => "session_start"
  add_index "log_session_6_201111", ["status"], :name => "status"

  create_table "log_session_6_201112", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201112", ["from_number"], :name => "from_number"
  add_index "log_session_6_201112", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201112", ["lid"], :name => "lid"
  add_index "log_session_6_201112", ["nas_id"], :name => "nas"
  add_index "log_session_6_201112", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201112", ["session_start"], :name => "session_start"
  add_index "log_session_6_201112", ["status"], :name => "status"

  create_table "log_session_6_201201", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201201", ["from_number"], :name => "from_number"
  add_index "log_session_6_201201", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201201", ["lid"], :name => "lid"
  add_index "log_session_6_201201", ["nas_id"], :name => "nas"
  add_index "log_session_6_201201", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201201", ["session_start"], :name => "session_start"
  add_index "log_session_6_201201", ["status"], :name => "status"

  create_table "log_session_6_201202", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201202", ["from_number"], :name => "from_number"
  add_index "log_session_6_201202", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201202", ["lid"], :name => "lid"
  add_index "log_session_6_201202", ["nas_id"], :name => "nas"
  add_index "log_session_6_201202", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201202", ["session_start"], :name => "session_start"
  add_index "log_session_6_201202", ["status"], :name => "status"

  create_table "log_session_6_201203", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201203", ["from_number"], :name => "from_number"
  add_index "log_session_6_201203", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201203", ["lid"], :name => "lid"
  add_index "log_session_6_201203", ["nas_id"], :name => "nas"
  add_index "log_session_6_201203", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201203", ["session_start"], :name => "session_start"
  add_index "log_session_6_201203", ["status"], :name => "status"

  create_table "log_session_6_201204", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201204", ["from_number"], :name => "from_number"
  add_index "log_session_6_201204", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201204", ["lid"], :name => "lid"
  add_index "log_session_6_201204", ["nas_id"], :name => "nas"
  add_index "log_session_6_201204", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201204", ["session_start"], :name => "session_start"
  add_index "log_session_6_201204", ["status"], :name => "status"

  create_table "log_session_6_201205", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201205", ["from_number"], :name => "from_number"
  add_index "log_session_6_201205", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201205", ["lid"], :name => "lid"
  add_index "log_session_6_201205", ["nas_id"], :name => "nas"
  add_index "log_session_6_201205", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201205", ["session_start"], :name => "session_start"
  add_index "log_session_6_201205", ["status"], :name => "status"

  create_table "log_session_6_201206", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201206", ["from_number"], :name => "from_number"
  add_index "log_session_6_201206", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201206", ["lid"], :name => "lid"
  add_index "log_session_6_201206", ["nas_id"], :name => "nas"
  add_index "log_session_6_201206", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201206", ["session_start"], :name => "session_start"
  add_index "log_session_6_201206", ["status"], :name => "status"

  create_table "log_session_6_201207", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201207", ["from_number"], :name => "from_number"
  add_index "log_session_6_201207", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201207", ["lid"], :name => "lid"
  add_index "log_session_6_201207", ["nas_id"], :name => "nas"
  add_index "log_session_6_201207", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201207", ["session_start"], :name => "session_start"
  add_index "log_session_6_201207", ["status"], :name => "status"

  create_table "log_session_6_201208", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 32,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201208", ["from_number"], :name => "from_number"
  add_index "log_session_6_201208", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201208", ["lid"], :name => "lid"
  add_index "log_session_6_201208", ["nas_id"], :name => "nas"
  add_index "log_session_6_201208", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201208", ["session_start"], :name => "session_start"
  add_index "log_session_6_201208", ["status"], :name => "status"

  create_table "log_session_6_201209", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 80,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201209", ["from_number"], :name => "from_number"
  add_index "log_session_6_201209", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201209", ["lid"], :name => "lid"
  add_index "log_session_6_201209", ["nas_id"], :name => "nas"
  add_index "log_session_6_201209", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201209", ["session_start"], :name => "session_start"
  add_index "log_session_6_201209", ["status"], :name => "status"

  create_table "log_session_6_201210", :force => true do |t|
    t.integer  "lid",                                         :null => false
    t.integer  "nas_id",                                      :null => false
    t.string   "nas_port",      :limit => 16,                 :null => false
    t.string   "session_id",    :limit => 80,                 :null => false
    t.datetime "session_start",                               :null => false
    t.datetime "session_stop",                                :null => false
    t.integer  "session_time",                                :null => false
    t.float    "session_cost",  :limit => 15,                 :null => false
    t.string   "from_number",   :limit => 30,                 :null => false
    t.string   "to_number",     :limit => 30,                 :null => false
    t.integer  "input_octets",  :limit => 8,   :default => 0, :null => false
    t.integer  "output_octets", :limit => 8,   :default => 0, :null => false
    t.integer  "status",                       :default => 0, :null => false
    t.integer  "lr",                                          :null => false
    t.integer  "ipaddr",        :limit => 8,                  :null => false
    t.string   "login_name",    :limit => 100,                :null => false
    t.integer  "sid_time",                                    :null => false
    t.integer  "fake",          :limit => 1,                  :null => false
  end

  add_index "log_session_6_201210", ["from_number"], :name => "from_number"
  add_index "log_session_6_201210", ["ipaddr"], :name => "ipaddr"
  add_index "log_session_6_201210", ["lid"], :name => "lid"
  add_index "log_session_6_201210", ["nas_id"], :name => "nas"
  add_index "log_session_6_201210", ["session_start", "lid", "id"], :name => "start_lid_id"
  add_index "log_session_6_201210", ["session_start"], :name => "session_start"
  add_index "log_session_6_201210", ["status"], :name => "status"

  create_table "log_session_net_6_201009", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201009", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201010", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201010", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201011", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201011", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201012", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201012", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201101", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201101", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201102", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201102", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201103", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201103", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201104", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201104", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201105", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201105", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201106", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201106", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201107", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201107", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201108", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201108", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201109", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201109", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201110", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201110", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201111", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201111", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201112", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201112", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201201", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201201", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201202", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201202", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201203", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201203", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201204", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201204", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201205", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201205", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201206", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201206", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201207", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201207", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201208", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201208", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201209", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201209", ["session_id"], :name => "session_id"

  create_table "log_session_net_6_201210", :id => false, :force => true do |t|
    t.integer "session_id",              :null => false
    t.integer "net",        :limit => 8, :null => false
    t.integer "mask",       :limit => 8, :null => false
  end

  add_index "log_session_net_6_201210", ["session_id"], :name => "session_id"

  create_table "login_account_6_201009", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201009", ["dm"], :name => "dd"
  add_index "login_account_6_201009", ["hh"], :name => "hh"
  add_index "login_account_6_201009", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201010", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201010", ["dm"], :name => "dd"
  add_index "login_account_6_201010", ["hh"], :name => "hh"
  add_index "login_account_6_201010", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201011", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201011", ["dm"], :name => "dd"
  add_index "login_account_6_201011", ["hh"], :name => "hh"
  add_index "login_account_6_201011", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201012", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201012", ["dm"], :name => "dd"
  add_index "login_account_6_201012", ["hh"], :name => "hh"
  add_index "login_account_6_201012", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201101", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201101", ["dm"], :name => "dd"
  add_index "login_account_6_201101", ["hh"], :name => "hh"
  add_index "login_account_6_201101", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201102", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201102", ["dm"], :name => "dd"
  add_index "login_account_6_201102", ["hh"], :name => "hh"
  add_index "login_account_6_201102", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201103", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201103", ["dm"], :name => "dd"
  add_index "login_account_6_201103", ["hh"], :name => "hh"
  add_index "login_account_6_201103", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201104", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201104", ["dm"], :name => "dd"
  add_index "login_account_6_201104", ["hh"], :name => "hh"
  add_index "login_account_6_201104", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201105", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201105", ["dm"], :name => "dd"
  add_index "login_account_6_201105", ["hh"], :name => "hh"
  add_index "login_account_6_201105", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201106", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201106", ["dm"], :name => "dd"
  add_index "login_account_6_201106", ["hh"], :name => "hh"
  add_index "login_account_6_201106", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201107", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201107", ["dm"], :name => "dd"
  add_index "login_account_6_201107", ["hh"], :name => "hh"
  add_index "login_account_6_201107", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201108", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201108", ["dm"], :name => "dd"
  add_index "login_account_6_201108", ["hh"], :name => "hh"
  add_index "login_account_6_201108", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201109", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201109", ["dm"], :name => "dd"
  add_index "login_account_6_201109", ["hh"], :name => "hh"
  add_index "login_account_6_201109", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201110", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201110", ["dm"], :name => "dd"
  add_index "login_account_6_201110", ["hh"], :name => "hh"
  add_index "login_account_6_201110", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201111", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201111", ["dm"], :name => "dd"
  add_index "login_account_6_201111", ["hh"], :name => "hh"
  add_index "login_account_6_201111", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201112", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201112", ["dm"], :name => "dd"
  add_index "login_account_6_201112", ["hh"], :name => "hh"
  add_index "login_account_6_201112", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201201", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201201", ["dm"], :name => "dd"
  add_index "login_account_6_201201", ["hh"], :name => "hh"
  add_index "login_account_6_201201", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201202", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201202", ["dm"], :name => "dd"
  add_index "login_account_6_201202", ["hh"], :name => "hh"
  add_index "login_account_6_201202", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201203", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201203", ["dm"], :name => "dd"
  add_index "login_account_6_201203", ["hh"], :name => "hh"
  add_index "login_account_6_201203", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201204", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201204", ["dm"], :name => "dd"
  add_index "login_account_6_201204", ["hh"], :name => "hh"
  add_index "login_account_6_201204", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201205", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201205", ["dm"], :name => "dd"
  add_index "login_account_6_201205", ["hh"], :name => "hh"
  add_index "login_account_6_201205", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201206", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201206", ["dm"], :name => "dd"
  add_index "login_account_6_201206", ["hh"], :name => "hh"
  add_index "login_account_6_201206", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201207", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201207", ["dm"], :name => "dd"
  add_index "login_account_6_201207", ["hh"], :name => "hh"
  add_index "login_account_6_201207", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201208", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201208", ["dm"], :name => "dd"
  add_index "login_account_6_201208", ["hh"], :name => "hh"
  add_index "login_account_6_201208", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201209", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201209", ["dm"], :name => "dd"
  add_index "login_account_6_201209", ["hh"], :name => "hh"
  add_index "login_account_6_201209", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_account_6_201210", :id => false, :force => true do |t|
    t.integer "dm",                  :null => false
    t.integer "hh",                  :null => false
    t.integer "lid",                 :null => false
    t.integer "sid",                 :null => false
    t.integer "amount", :limit => 8, :null => false
    t.float   "sum",                 :null => false
  end

  add_index "login_account_6_201210", ["dm"], :name => "dd"
  add_index "login_account_6_201210", ["hh"], :name => "hh"
  add_index "login_account_6_201210", ["lid", "sid", "dm", "hh"], :name => "lid_sid_dm_hh"

  create_table "login_parameter_1", :id => false, :force => true do |t|
    t.string  "value", :null => false
    t.string  "name",  :null => false
    t.integer "lid",   :null => false
  end

  add_index "login_parameter_1", ["lid"], :name => "lid"

  create_table "login_parameter_6", :id => false, :force => true do |t|
    t.string  "value", :null => false
    t.string  "name",  :null => false
    t.integer "lid",   :null => false
  end

  add_index "login_parameter_6", ["lid"], :name => "lid"

  create_table "login_parameter_8", :id => false, :force => true do |t|
    t.string  "value", :null => false
    t.string  "name",  :null => false
    t.integer "lid",   :null => false
  end

  add_index "login_parameter_8", ["lid"], :name => "lid"

  create_table "login_parameter_log_1", :id => false, :force => true do |t|
    t.integer  "id",    :null => false
    t.string   "name",  :null => false
    t.integer  "lid",   :null => false
    t.string   "value", :null => false
    t.datetime "dt",    :null => false
    t.integer  "user",  :null => false
  end

  add_index "login_parameter_log_1", ["id"], :name => "id"
  add_index "login_parameter_log_1", ["lid"], :name => "lid"

  create_table "login_parameter_log_6", :id => false, :force => true do |t|
    t.integer  "id",    :null => false
    t.string   "name",  :null => false
    t.integer  "lid",   :null => false
    t.string   "value", :null => false
    t.datetime "dt",    :null => false
    t.integer  "user",  :null => false
  end

  add_index "login_parameter_log_6", ["id"], :name => "id"
  add_index "login_parameter_log_6", ["lid"], :name => "lid"

  create_table "login_parameter_log_8", :id => false, :force => true do |t|
    t.integer  "id",    :null => false
    t.string   "name",  :null => false
    t.integer  "lid",   :null => false
    t.string   "value", :null => false
    t.datetime "dt",    :null => false
    t.integer  "user",  :null => false
  end

  add_index "login_parameter_log_8", ["id"], :name => "id"
  add_index "login_parameter_log_8", ["lid"], :name => "lid"

  create_table "mail_list", :force => true do |t|
    t.string  "title", :limit => 50, :default => "0"
    t.integer "flag",                :default => 0
    t.boolean "type",                :default => false
    t.integer "up",                  :default => 0
  end

  add_index "mail_list", ["up"], :name => "up"

  create_table "mail_list_message", :force => true do |t|
    t.string "subject"
    t.text   "text"
  end

  create_table "mail_temp", :id => false, :force => true do |t|
    t.integer  "id",  :default => 0, :null => false
    t.integer  "eid"
    t.datetime "dt"
  end

  create_table "message_for_users", :force => true do |t|
    t.datetime "date_from",                :null => false
    t.datetime "date_to",                  :null => false
    t.text     "text",                     :null => false
    t.string   "gr",        :limit => 100, :null => false
    t.string   "title",     :limit => 100, :null => false
    t.string   "users",     :limit => 100, :null => false
  end

  create_table "module", :force => true do |t|
    t.string  "title",          :limit => 150, :default => "", :null => false
    t.string  "package_client", :limit => 150, :default => "", :null => false
    t.string  "package_server", :limit => 150, :default => "", :null => false
    t.string  "name",           :limit => 16,  :default => "", :null => false
    t.integer "config_id"
  end

  add_index "module", ["name"], :name => "name"

  create_table "module_config", :force => true do |t|
    t.integer  "mid",                          :default => 0
    t.datetime "dt",                                            :null => false
    t.string   "title",  :limit => 150,        :default => "0", :null => false
    t.integer  "active", :limit => 1,          :default => 0,   :null => false
    t.integer  "uid",                          :default => 0
    t.text     "config", :limit => 2147483647
  end

  add_index "module_config", ["mid", "active"], :name => "mid_active"

  create_table "module_tariff_tree", :force => true do |t|
    t.integer "mid",                      :default => 0, :null => false
    t.integer "tree_id",                  :default => 0, :null => false
    t.integer "parent_tree",              :default => 0, :null => false
    t.integer "lm",          :limit => 8, :default => 0, :null => false
  end

  add_index "module_tariff_tree", ["mid", "tree_id"], :name => "mid_tree"
  add_index "module_tariff_tree", ["tree_id"], :name => "tree_id"

  create_table "mtree_node", :force => true do |t|
    t.integer "parent_node",               :default => 0,  :null => false
    t.integer "mtree_id",                  :default => 0,  :null => false
    t.string  "type",        :limit => 20, :default => "", :null => false
    t.text    "data",                                      :null => false
    t.integer "pos",                       :default => 0,  :null => false
  end

  add_index "mtree_node", ["mtree_id"], :name => "tree_id"

  create_table "nas_6", :force => true do |t|
    t.string  "identifier",       :limit => 32, :default => "", :null => false
    t.string  "secret",           :limit => 16, :default => "", :null => false
    t.integer "ipaddr",                         :default => 0,  :null => false
    t.integer "type",             :limit => 1,  :default => 0,  :null => false
    t.date    "date1"
    t.date    "date2"
    t.string  "comment",                        :default => "", :null => false
    t.integer "config_id",                      :default => 0,  :null => false
    t.integer "vendor",                         :default => 0,  :null => false
    t.text    "script",                                         :null => false
    t.string  "common_config_id",                               :null => false
  end

  create_table "nas_config_6", :force => true do |t|
    t.integer  "nas_id",                :default => 0,  :null => false
    t.datetime "dt",                                    :null => false
    t.string   "title",  :limit => 150, :default => "", :null => false
    t.integer  "uid",                   :default => 0,  :null => false
    t.text     "config",                                :null => false
  end

  create_table "news", :force => true do |t|
    t.integer  "gr",    :limit => 8,   :default => 0,  :null => false
    t.datetime "dt",                                   :null => false
    t.string   "title", :limit => 150, :default => "", :null => false
    t.text     "txt",                                  :null => false
  end

  create_table "npay_add_cost_detail_3_200706", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200706", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200707", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200707", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200708", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200708", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200709", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200709", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200710", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200710", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200711", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200711", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200712", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200712", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200801", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200801", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200802", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200802", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200803", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200803", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200804", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200804", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200805", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200805", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200806", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200806", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200807", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200807", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200808", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200808", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200809", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200809", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200810", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200810", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200811", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200811", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200812", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200812", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200901", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200901", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200902", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200902", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200903", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200903", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200904", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200904", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200905", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200905", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200906", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200906", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200907", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200907", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200908", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200908", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200909", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200909", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200910", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200910", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200911", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200911", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_200912", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_200912", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201001", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201001", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201002", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201002", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201003", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201003", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201004", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201004", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201005", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201005", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201006", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201006", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201007", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201007", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201008", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201008", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201009", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201009", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201010", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201010", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201011", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201011", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201012", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201012", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201101", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201101", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201102", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201102", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201103", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201103", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201104", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201104", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201105", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201105", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201106", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201106", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201107", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201107", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201108", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201108", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201109", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201109", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201110", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201110", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201111", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201111", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201112", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201112", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201201", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201201", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201202", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201202", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201203", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201203", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201204", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201204", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201205", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201205", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201206", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201206", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201207", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201207", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201208", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201208", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201209", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201209", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201210", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201210", ["cid"], :name => "cid"

  create_table "npay_add_cost_detail_3_201211", :id => false, :force => true do |t|
    t.integer "cid",                                  :null => false
    t.integer "sid",                                  :null => false
    t.decimal "summa", :precision => 15, :scale => 2, :null => false
  end

  add_index "npay_add_cost_detail_3_201211", ["cid"], :name => "cid"

  create_table "npay_detail_3_200706", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200706", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200706", ["mid"], :name => "mid"
  add_index "npay_detail_3_200706", ["sid"], :name => "sid"
  add_index "npay_detail_3_200706", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200707", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200707", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200707", ["mid"], :name => "mid"
  add_index "npay_detail_3_200707", ["sid"], :name => "sid"
  add_index "npay_detail_3_200707", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200708", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200708", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200708", ["mid"], :name => "mid"
  add_index "npay_detail_3_200708", ["sid"], :name => "sid"
  add_index "npay_detail_3_200708", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200709", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200709", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200709", ["mid"], :name => "mid"
  add_index "npay_detail_3_200709", ["sid"], :name => "sid"
  add_index "npay_detail_3_200709", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200710", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200710", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200710", ["mid"], :name => "mid"
  add_index "npay_detail_3_200710", ["sid"], :name => "sid"
  add_index "npay_detail_3_200710", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200711", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200711", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200711", ["mid"], :name => "mid"
  add_index "npay_detail_3_200711", ["sid"], :name => "sid"
  add_index "npay_detail_3_200711", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200712", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200712", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200712", ["mid"], :name => "mid"
  add_index "npay_detail_3_200712", ["sid"], :name => "sid"
  add_index "npay_detail_3_200712", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200801", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200801", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200801", ["mid"], :name => "mid"
  add_index "npay_detail_3_200801", ["sid"], :name => "sid"
  add_index "npay_detail_3_200801", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200802", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200802", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200802", ["mid"], :name => "mid"
  add_index "npay_detail_3_200802", ["sid"], :name => "sid"
  add_index "npay_detail_3_200802", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200803", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200803", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200803", ["mid"], :name => "mid"
  add_index "npay_detail_3_200803", ["sid"], :name => "sid"
  add_index "npay_detail_3_200803", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200804", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200804", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200804", ["mid"], :name => "mid"
  add_index "npay_detail_3_200804", ["sid"], :name => "sid"
  add_index "npay_detail_3_200804", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200805", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200805", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200805", ["mid"], :name => "mid"
  add_index "npay_detail_3_200805", ["sid"], :name => "sid"
  add_index "npay_detail_3_200805", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200806", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200806", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200806", ["mid"], :name => "mid"
  add_index "npay_detail_3_200806", ["sid"], :name => "sid"
  add_index "npay_detail_3_200806", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200807", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200807", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200807", ["mid"], :name => "mid"
  add_index "npay_detail_3_200807", ["sid"], :name => "sid"
  add_index "npay_detail_3_200807", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200808", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200808", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200808", ["mid"], :name => "mid"
  add_index "npay_detail_3_200808", ["sid"], :name => "sid"
  add_index "npay_detail_3_200808", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200809", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200809", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200809", ["mid"], :name => "mid"
  add_index "npay_detail_3_200809", ["sid"], :name => "sid"
  add_index "npay_detail_3_200809", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200810", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200810", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200810", ["mid"], :name => "mid"
  add_index "npay_detail_3_200810", ["sid"], :name => "sid"
  add_index "npay_detail_3_200810", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200811", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200811", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200811", ["mid"], :name => "mid"
  add_index "npay_detail_3_200811", ["sid"], :name => "sid"
  add_index "npay_detail_3_200811", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200812", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200812", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200812", ["mid"], :name => "mid"
  add_index "npay_detail_3_200812", ["sid"], :name => "sid"
  add_index "npay_detail_3_200812", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200901", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200901", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200901", ["mid"], :name => "mid"
  add_index "npay_detail_3_200901", ["sid"], :name => "sid"
  add_index "npay_detail_3_200901", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200902", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200902", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200902", ["mid"], :name => "mid"
  add_index "npay_detail_3_200902", ["sid"], :name => "sid"
  add_index "npay_detail_3_200902", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200903", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200903", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200903", ["mid"], :name => "mid"
  add_index "npay_detail_3_200903", ["sid"], :name => "sid"
  add_index "npay_detail_3_200903", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200904", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200904", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200904", ["mid"], :name => "mid"
  add_index "npay_detail_3_200904", ["sid"], :name => "sid"
  add_index "npay_detail_3_200904", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200905", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200905", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200905", ["mid"], :name => "mid"
  add_index "npay_detail_3_200905", ["sid"], :name => "sid"
  add_index "npay_detail_3_200905", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200906", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200906", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200906", ["mid"], :name => "mid"
  add_index "npay_detail_3_200906", ["sid"], :name => "sid"
  add_index "npay_detail_3_200906", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200907", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200907", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200907", ["mid"], :name => "mid"
  add_index "npay_detail_3_200907", ["sid"], :name => "sid"
  add_index "npay_detail_3_200907", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200908", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200908", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200908", ["mid"], :name => "mid"
  add_index "npay_detail_3_200908", ["sid"], :name => "sid"
  add_index "npay_detail_3_200908", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200909", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200909", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200909", ["mid"], :name => "mid"
  add_index "npay_detail_3_200909", ["sid"], :name => "sid"
  add_index "npay_detail_3_200909", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200910", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200910", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200910", ["mid"], :name => "mid"
  add_index "npay_detail_3_200910", ["sid"], :name => "sid"
  add_index "npay_detail_3_200910", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200911", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200911", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200911", ["mid"], :name => "mid"
  add_index "npay_detail_3_200911", ["sid"], :name => "sid"
  add_index "npay_detail_3_200911", ["sid"], :name => "treeId"

  create_table "npay_detail_3_200912", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_200912", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_200912", ["mid"], :name => "mid"
  add_index "npay_detail_3_200912", ["sid"], :name => "sid"
  add_index "npay_detail_3_200912", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201001", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201001", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201001", ["mid"], :name => "mid"
  add_index "npay_detail_3_201001", ["sid"], :name => "sid"

  create_table "npay_detail_3_201002", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201002", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201002", ["mid"], :name => "mid"
  add_index "npay_detail_3_201002", ["sid"], :name => "sid"

  create_table "npay_detail_3_201003", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201003", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201003", ["mid"], :name => "mid"
  add_index "npay_detail_3_201003", ["sid"], :name => "sid"

  create_table "npay_detail_3_201004", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201004", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201004", ["mid"], :name => "mid"
  add_index "npay_detail_3_201004", ["sid"], :name => "sid"

  create_table "npay_detail_3_201005", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201005", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201005", ["mid"], :name => "mid"
  add_index "npay_detail_3_201005", ["sid"], :name => "sid"

  create_table "npay_detail_3_201006", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201006", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201006", ["mid"], :name => "mid"
  add_index "npay_detail_3_201006", ["sid"], :name => "sid"

  create_table "npay_detail_3_201007", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201007", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201007", ["mid"], :name => "mid"
  add_index "npay_detail_3_201007", ["sid"], :name => "sid"

  create_table "npay_detail_3_201008", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201008", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201008", ["mid"], :name => "mid"
  add_index "npay_detail_3_201008", ["sid"], :name => "sid"

  create_table "npay_detail_3_201009", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201009", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201009", ["mid"], :name => "mid"
  add_index "npay_detail_3_201009", ["sid"], :name => "sid"

  create_table "npay_detail_3_201010", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201010", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201010", ["mid"], :name => "mid"
  add_index "npay_detail_3_201010", ["sid"], :name => "sid"

  create_table "npay_detail_3_201011", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201011", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201011", ["mid"], :name => "mid"
  add_index "npay_detail_3_201011", ["sid"], :name => "sid"

  create_table "npay_detail_3_201012", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201012", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201012", ["mid"], :name => "mid"
  add_index "npay_detail_3_201012", ["sid"], :name => "sid"

  create_table "npay_detail_3_201101", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201101", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201101", ["mid"], :name => "mid"
  add_index "npay_detail_3_201101", ["sid"], :name => "sid"

  create_table "npay_detail_3_201102", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201102", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201102", ["mid"], :name => "mid"
  add_index "npay_detail_3_201102", ["sid"], :name => "sid"

  create_table "npay_detail_3_201103", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
    t.integer "col",                  :null => false
    t.integer "treeId",               :null => false
  end

  add_index "npay_detail_3_201103", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201103", ["mid"], :name => "mid"
  add_index "npay_detail_3_201103", ["sid"], :name => "sid"

  create_table "npay_detail_3_201104", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201104", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201104", ["mid"], :name => "mid"
  add_index "npay_detail_3_201104", ["sid"], :name => "sid"
  add_index "npay_detail_3_201104", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201105", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201105", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201105", ["mid"], :name => "mid"
  add_index "npay_detail_3_201105", ["sid"], :name => "sid"
  add_index "npay_detail_3_201105", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201106", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201106", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201106", ["mid"], :name => "mid"
  add_index "npay_detail_3_201106", ["sid"], :name => "sid"
  add_index "npay_detail_3_201106", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201107", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201107", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201107", ["mid"], :name => "mid"
  add_index "npay_detail_3_201107", ["sid"], :name => "sid"
  add_index "npay_detail_3_201107", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201108", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201108", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201108", ["mid"], :name => "mid"
  add_index "npay_detail_3_201108", ["sid"], :name => "sid"
  add_index "npay_detail_3_201108", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201109", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201109", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201109", ["mid"], :name => "mid"
  add_index "npay_detail_3_201109", ["sid"], :name => "sid"
  add_index "npay_detail_3_201109", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201110", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201110", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201110", ["mid"], :name => "mid"
  add_index "npay_detail_3_201110", ["sid"], :name => "sid"
  add_index "npay_detail_3_201110", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201111", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201111", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201111", ["mid"], :name => "mid"
  add_index "npay_detail_3_201111", ["sid"], :name => "sid"
  add_index "npay_detail_3_201111", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201112", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201112", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201112", ["mid"], :name => "mid"
  add_index "npay_detail_3_201112", ["sid"], :name => "sid"
  add_index "npay_detail_3_201112", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201201", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201201", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201201", ["mid"], :name => "mid"
  add_index "npay_detail_3_201201", ["sid"], :name => "sid"
  add_index "npay_detail_3_201201", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201202", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201202", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201202", ["mid"], :name => "mid"
  add_index "npay_detail_3_201202", ["sid"], :name => "sid"
  add_index "npay_detail_3_201202", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201203", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201203", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201203", ["mid"], :name => "mid"
  add_index "npay_detail_3_201203", ["sid"], :name => "sid"
  add_index "npay_detail_3_201203", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201204", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201204", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201204", ["mid"], :name => "mid"
  add_index "npay_detail_3_201204", ["sid"], :name => "sid"
  add_index "npay_detail_3_201204", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201205", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201205", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201205", ["mid"], :name => "mid"
  add_index "npay_detail_3_201205", ["sid"], :name => "sid"
  add_index "npay_detail_3_201205", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201206", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201206", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201206", ["mid"], :name => "mid"
  add_index "npay_detail_3_201206", ["sid"], :name => "sid"
  add_index "npay_detail_3_201206", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201207", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201207", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201207", ["mid"], :name => "mid"
  add_index "npay_detail_3_201207", ["sid"], :name => "sid"
  add_index "npay_detail_3_201207", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201208", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201208", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201208", ["mid"], :name => "mid"
  add_index "npay_detail_3_201208", ["sid"], :name => "sid"
  add_index "npay_detail_3_201208", ["sid"], :name => "treeId"

  create_table "npay_detail_3_201209", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201209", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201209", ["mid"], :name => "mid"
  add_index "npay_detail_3_201209", ["sid"], :name => "sid"
  add_index "npay_detail_3_201209", ["treeId"], :name => "treeId"

  create_table "npay_detail_3_201210", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201210", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201210", ["mid"], :name => "mid"
  add_index "npay_detail_3_201210", ["sid"], :name => "sid"
  add_index "npay_detail_3_201210", ["treeId"], :name => "treeId"

  create_table "npay_detail_3_201211", :id => false, :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "mid",                  :null => false
    t.integer "eid",                  :null => false
    t.integer "sid",                  :null => false
    t.integer "treeId",               :null => false
    t.integer "col",                  :null => false
    t.float   "summa",  :limit => 15, :null => false
  end

  add_index "npay_detail_3_201211", ["cid", "mid", "eid"], :name => "cid_mid_eid"
  add_index "npay_detail_3_201211", ["mid"], :name => "mid"
  add_index "npay_detail_3_201211", ["sid"], :name => "sid"
  add_index "npay_detail_3_201211", ["treeId"], :name => "treeId"

  create_table "npay_service_object_3", :force => true do |t|
    t.integer "cid",                    :null => false
    t.integer "sid",                    :null => false
    t.integer "csid",                   :null => false
    t.integer "oid",                    :null => false
    t.integer "col",                    :null => false
    t.date    "date1"
    t.date    "date2"
    t.integer "emid",                   :null => false
    t.integer "eid",                    :null => false
    t.string  "comment", :limit => 250, :null => false
  end

  add_index "npay_service_object_3", ["cid"], :name => "cid"
  add_index "npay_service_object_3", ["csid"], :name => "csid"
  add_index "npay_service_object_3", ["oid"], :name => "oid"

  create_table "object", :force => true do |t|
    t.integer "cid",                    :default => 0,  :null => false
    t.string  "title",   :limit => 250, :default => "", :null => false
    t.integer "type_id",                :default => 0,  :null => false
    t.date    "date1"
    t.date    "date2"
    t.integer "pos"
  end

  add_index "object", ["cid"], :name => "cid"
  add_index "object", ["pos"], :name => "pos"

  create_table "object_list_value", :force => true do |t|
    t.integer "param_id",                :default => 0,  :null => false
    t.string  "title",    :limit => 250, :default => "", :null => false
  end

  add_index "object_list_value", ["param_id"], :name => "param_id"

  create_table "object_param", :force => true do |t|
    t.string  "title",   :limit => 250, :default => "",    :null => false
    t.boolean "type",                   :default => false, :null => false
    t.string  "comment",                                   :null => false
    t.integer "history", :limit => 1,                      :null => false
  end

  create_table "object_param_value_address", :id => false, :force => true do |t|
    t.integer "object_id",                 :default => 0,   :null => false
    t.integer "param_id",                  :default => 0,   :null => false
    t.integer "hid",                       :default => 0,   :null => false
    t.string  "flat",       :limit => 15,  :default => "0", :null => false
    t.string  "room",       :limit => 20,  :default => "",  :null => false
    t.integer "pod",                       :default => 0,   :null => false
    t.integer "floor",                     :default => 0,   :null => false
    t.string  "address",    :limit => 250, :default => "",  :null => false
    t.string  "comment",    :limit => 250, :default => "",  :null => false
    t.string  "format_key", :limit => 50
  end

  create_table "object_param_value_address_log", :id => false, :force => true do |t|
    t.integer  "object_id",                :null => false
    t.integer  "param_id",                 :null => false
    t.string   "value",     :limit => 250, :null => false
    t.datetime "dt_change",                :null => false
    t.integer  "user_id",                  :null => false
  end

  add_index "object_param_value_address_log", ["object_id", "param_id"], :name => "object_id"

  create_table "object_param_value_date", :id => false, :force => true do |t|
    t.integer "object_id", :default => 0, :null => false
    t.integer "param_id",  :default => 0, :null => false
    t.date    "value"
  end

  create_table "object_param_value_date_log", :id => false, :force => true do |t|
    t.integer  "object_id", :null => false
    t.integer  "param_id",  :null => false
    t.date     "value"
    t.datetime "dt_change", :null => false
    t.integer  "user_id",   :null => false
  end

  add_index "object_param_value_date_log", ["param_id", "object_id"], :name => "param_id"

  create_table "object_param_value_flag", :id => false, :force => true do |t|
    t.integer "object_id", :null => false
    t.integer "param_id",  :null => false
    t.integer "value",     :null => false
  end

  create_table "object_param_value_flag_log", :id => false, :force => true do |t|
    t.integer  "object_id", :null => false
    t.integer  "param_id",  :null => false
    t.integer  "value",     :null => false
    t.datetime "dt_change", :null => false
    t.integer  "user_id",   :null => false
  end

  add_index "object_param_value_flag_log", ["object_id", "param_id"], :name => "object_id"

  create_table "object_param_value_list", :id => false, :force => true do |t|
    t.integer "object_id", :default => 0, :null => false
    t.integer "param_id",  :default => 0, :null => false
    t.integer "value",     :default => 0, :null => false
  end

  create_table "object_param_value_list_log", :id => false, :force => true do |t|
    t.integer  "object_id",                :null => false
    t.integer  "param_id",                 :null => false
    t.integer  "value",                    :null => false
    t.string   "title",     :limit => 250, :null => false
    t.datetime "dt_change",                :null => false
    t.integer  "user_id",                  :null => false
  end

  add_index "object_param_value_list_log", ["param_id", "object_id"], :name => "param_id"

  create_table "object_param_value_text", :id => false, :force => true do |t|
    t.integer "object_id",                :default => 0,  :null => false
    t.integer "param_id",                 :default => 0,  :null => false
    t.string  "value",     :limit => 250, :default => "", :null => false
  end

  create_table "object_param_value_text_log", :id => false, :force => true do |t|
    t.integer  "object_id",                :null => false
    t.integer  "param_id",                 :null => false
    t.string   "value",     :limit => 250, :null => false
    t.datetime "dt_change",                :null => false
    t.integer  "user_id",                  :null => false
  end

  add_index "object_param_value_text_log", ["param_id", "object_id"], :name => "param_id"

  create_table "object_type", :force => true do |t|
    t.string  "title",       :limit => 250, :default => "",    :null => false
    t.string  "name_macros", :limit => 250, :default => "",    :null => false
    t.string  "comment",                                       :null => false
    t.boolean "ishidden",                   :default => false
  end

  create_table "object_type_module", :id => false, :force => true do |t|
    t.integer "type_id", :null => false
    t.integer "mid",     :null => false
  end

  add_index "object_type_module", ["mid", "type_id"], :name => "type_mid", :unique => true

  create_table "object_type_param", :id => false, :force => true do |t|
    t.integer "type_id",  :default => 0, :null => false
    t.integer "param_id", :default => 0, :null => false
    t.integer "pos",      :default => 0, :null => false
  end

  create_table "payment_register", :id => false, :force => true do |t|
    t.integer  "id",                                                                          :null => false
    t.date     "date"
    t.string   "title",        :limit => 200,                                :default => "",  :null => false
    t.integer  "pt",                                                         :default => 0,   :null => false
    t.datetime "load_time"
    t.integer  "count",                                                      :default => 0,   :null => false
    t.integer  "errorCount",                                                 :default => -1,  :null => false
    t.decimal  "summa",                       :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer  "processed",    :limit => 1,                                  :default => 0,   :null => false
    t.datetime "process_time"
    t.text     "load_log",                                                                    :null => false
    t.string   "ptitle",       :limit => 50,                                                  :null => false
    t.integer  "regtype",                                                    :default => 0,   :null => false
  end

  add_index "payment_register", ["date"], :name => "date"
  add_index "payment_register", ["id"], :name => "id"

  create_table "payment_register_item", :force => true do |t|
    t.integer "rid",                    :default => 0,   :null => false
    t.integer "cid",                    :default => 0,   :null => false
    t.float   "summa",   :limit => 10,  :default => 0.0, :null => false
    t.integer "pid",                    :default => 0,   :null => false
    t.string  "comment", :limit => 200, :default => "",  :null => false
  end

  add_index "payment_register_item", ["rid"], :name => "rid"

  create_table "payment_register_item_201105", :force => true do |t|
    t.string  "unique_id", :limit => 20,                                                  :null => false
    t.integer "rid",                                                     :default => 0
    t.integer "cid",                                                     :default => 0
    t.date    "dt"
    t.decimal "summa",                    :precision => 10, :scale => 2, :default => 0.0
    t.integer "pid",                                                     :default => 0
    t.integer "ptid",                                                    :default => 0
    t.string  "comment",   :limit => 200,                                :default => ""
  end

  add_index "payment_register_item_201105", ["rid"], :name => "rid"
  add_index "payment_register_item_201105", ["unique_id"], :name => "unique_id"

  create_table "periodic_errors", :force => true do |t|
    t.string "marker",    :limit => 250, :null => false
    t.date   "calc_date"
    t.string "subject",   :limit => 250, :null => false
    t.text   "text"
    t.date   "reg_time"
  end

  create_table "plugin_config", :primary_key => "pid", :force => true do |t|
    t.text "config"
  end

  create_table "radius_pair_6", :id => false, :force => true do |t|
    t.integer "id",                       :default => 0,  :null => false
    t.string  "pair_name",  :limit => 50, :default => "", :null => false
    t.string  "pair_value",               :default => "", :null => false
    t.string  "pair_realm", :limit => 15, :default => "", :null => false
  end

  add_index "radius_pair_6", ["id"], :name => "id"

  create_table "radius_pair_ip_6", :id => false, :force => true do |t|
    t.integer "id",                  :default => 0,  :null => false
    t.string  "realm", :limit => 15, :default => "", :null => false
    t.integer "ip",    :limit => 8,  :default => 0,  :null => false
    t.date    "date1"
    t.date    "date2"
  end

  add_index "radius_pair_ip_6", ["id"], :name => "id"

  create_table "radius_pair_set_6", :id => false, :force => true do |t|
    t.integer "id",                   :default => 0,  :null => false
    t.integer "set_id",               :default => 0,  :null => false
    t.string  "realm",  :limit => 15, :default => "", :null => false
  end

  add_index "radius_pair_set_6", ["id"], :name => "id"

  create_table "register_group_task_type", :id => false, :force => true do |t|
    t.integer "gid",     :default => 0, :null => false
    t.integer "type_id", :default => 0, :null => false
  end

  add_index "register_group_task_type", ["gid"], :name => "gid"

  create_table "report_reference", :id => false, :force => true do |t|
    t.integer "id",                          :default => 0,   :null => false
    t.string  "module",       :limit => 100, :default => "",  :null => false
    t.string  "title",        :limit => 200, :default => "0", :null => false
    t.string  "report_class", :limit => 250, :default => "0", :null => false
    t.string  "params_class", :limit => 250, :default => "0", :null => false
  end

  add_index "report_reference", ["id"], :name => "id", :unique => true
  add_index "report_reference", ["id"], :name => "id_2"

  create_table "report_template", :id => false, :force => true do |t|
    t.string "name", :limit => 100, :default => "0", :null => false
    t.text   "data",                                 :null => false
  end

  add_index "report_template", ["name"], :name => "name"

  create_table "requestfls", :force => true do |t|
    t.string   "description"
    t.string   "fio",               :limit => 70,                 :null => false
    t.string   "adress_post",       :limit => 150,                :null => false
    t.string   "adress_connection", :limit => 150,                :null => false
    t.string   "latlng_connection", :limit => 100,                :null => false
    t.string   "email",             :limit => 40,                 :null => false
    t.string   "telephone",         :limit => 13,                 :null => false
    t.string   "in",                :limit => 30,                 :null => false
    t.string   "pasport",           :limit => 20,                 :null => false
    t.string   "pasport_authority", :limit => 60,                 :null => false
    t.date     "pasport_date"
    t.integer  "payment_form",                                    :null => false
    t.string   "ip",                :limit => 15,                 :null => false
    t.string   "login",             :limit => 15,                 :null => false
    t.string   "password",          :limit => 15,                 :null => false
    t.integer  "user_id",                                         :null => false
    t.integer  "technology",                                      :null => false
    t.integer  "node",                                            :null => false
    t.integer  "requeststatus_id",                 :default => 1, :null => false
    t.integer  "tariffplan_id",                                   :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "discard",           :limit => 400
  end

  create_table "requeststatuses", :force => true do |t|
    t.string   "title",      :limit => 30, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "rscm_service_account_5_201007", :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "sid",                  :null => false
    t.date    "date"
    t.integer "amount",  :limit => 8
    t.text    "comment",              :null => false
  end

  add_index "rscm_service_account_5_201007", ["cid"], :name => "cid"

  create_table "rscm_service_account_5_201010", :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "sid",                  :null => false
    t.date    "date"
    t.integer "amount",  :limit => 8
    t.text    "comment",              :null => false
  end

  add_index "rscm_service_account_5_201010", ["cid"], :name => "cid"

  create_table "rscm_service_account_5_201011", :force => true do |t|
    t.integer "cid",                  :null => false
    t.integer "sid",                  :null => false
    t.date    "date"
    t.integer "amount",  :limit => 8
    t.text    "comment",              :null => false
  end

  add_index "rscm_service_account_5_201011", ["cid"], :name => "cid"

  create_table "scheduled_class", :force => true do |t|
    t.string "title", :limit => 200
    t.string "class", :limit => 240
  end

  create_table "scheduled_periodic_run", :force => true do |t|
    t.text    "description"
    t.integer "amount",      :default => 0
  end

  create_table "scheduled_task_run", :force => true do |t|
    t.binary   "data",        :limit => 2147483647
    t.text     "description"
    t.integer  "executed",    :limit => 1,          :default => 0
    t.datetime "start_time"
  end

  create_table "scheduled_tasks", :force => true do |t|
    t.integer "mm",       :limit => 8, :default => 0,  :null => false
    t.integer "dm",                    :default => 0,  :null => false
    t.integer "dw",       :limit => 1, :default => 0,  :null => false
    t.integer "hh",                    :default => 0,  :null => false
    t.integer "min",      :limit => 8, :default => 0,  :null => false
    t.integer "prior",                 :default => 0,  :null => false
    t.date    "date1"
    t.date    "date2"
    t.integer "status",   :limit => 1, :default => 0,  :null => false
    t.integer "class_id",              :default => 0,  :null => false
    t.string  "comment",               :default => "", :null => false
    t.text    "params",                                :null => false
  end

  create_table "script", :force => true do |t|
    t.string "title", :limit => 100, :default => "", :null => false
  end

  create_table "script_backup", :force => true do |t|
    t.string    "title"
    t.integer   "script_id",                                :null => false
    t.text      "script"
    t.integer   "user_id",                                  :null => false
    t.timestamp "change_time",                              :null => false
    t.string    "comment",                  :default => ""
    t.integer   "type",        :limit => 1,                 :null => false
  end

  add_index "script_backup", ["script_id", "type"], :name => "script_type"

  create_table "script_classes", :primary_key => "name", :force => true do |t|
    t.binary  "data",                                 :null => false
    t.integer "last_mod", :limit => 8, :default => 0, :null => false
  end

  create_table "script_classes_ifaces", :id => false, :force => true do |t|
    t.string "name",  :null => false
    t.string "iface", :null => false
  end

  create_table "script_event_queue", :force => true do |t|
    t.binary "event", :limit => 2147483647, :null => false
  end

  create_table "script_event_type", :force => true do |t|
    t.string  "mid",        :limit => 100,                  :null => false
    t.integer "event_mode", :limit => 1,   :default => 1,   :null => false
    t.string  "event_id",                  :default => "0", :null => false
    t.string  "title",      :limit => 200, :default => "",  :null => false
  end

  add_index "script_event_type", ["mid", "event_id"], :name => "mid_event"

  create_table "script_function", :force => true do |t|
    t.integer   "script_id",                  :default => 0,  :null => false
    t.string    "title",       :limit => 100, :default => "", :null => false
    t.text      "code"
    t.integer   "user_id",                                    :null => false
    t.timestamp "change_time",                                :null => false
  end

  add_index "script_function", ["script_id"], :name => "script_id"

  create_table "script_function_event_type", :id => false, :force => true do |t|
    t.integer "fid",                     :default => 0,   :null => false
    t.string  "mid",      :limit => 100,                  :null => false
    t.string  "event_id",                :default => "0", :null => false
  end

  add_index "script_function_event_type", ["fid"], :name => "fid"

  create_table "script_lib", :force => true do |t|
    t.string    "name",        :limit => 100, :null => false
    t.string    "title",                      :null => false
    t.text      "script",                     :null => false
    t.integer   "user_id",                    :null => false
    t.timestamp "change_time",                :null => false
  end

  add_index "script_lib", ["name"], :name => "name", :unique => true

  create_table "sequential_ids", :primary_key => "mid", :force => true do |t|
    t.integer "value", :limit => 8, :null => false
  end

  create_table "service", :force => true do |t|
    t.string   "title",   :limit => 250,                   :null => false
    t.integer  "mid",                    :default => 0,    :null => false
    t.datetime "lm",                                       :null => false
    t.boolean  "isusing",                :default => true
  end

  add_index "service", ["mid"], :name => "mid"

  create_table "session_account_6_201009", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201009", ["cid"], :name => "cid"

  create_table "session_account_6_201010", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201010", ["cid"], :name => "cid"

  create_table "session_account_6_201011", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201011", ["cid"], :name => "cid"

  create_table "session_account_6_201012", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201012", ["cid"], :name => "cid"

  create_table "session_account_6_201101", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201101", ["cid"], :name => "cid"

  create_table "session_account_6_201102", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201102", ["cid"], :name => "cid"

  create_table "session_account_6_201103", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201103", ["cid"], :name => "cid"

  create_table "session_account_6_201104", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201104", ["cid"], :name => "cid"

  create_table "session_account_6_201105", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201105", ["cid"], :name => "cid"

  create_table "session_account_6_201106", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201106", ["cid"], :name => "cid"

  create_table "session_account_6_201107", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201107", ["cid"], :name => "cid"

  create_table "session_account_6_201108", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201108", ["cid"], :name => "cid"

  create_table "session_account_6_201109", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201109", ["cid"], :name => "cid"

  create_table "session_account_6_201110", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201110", ["cid"], :name => "cid"

  create_table "session_account_6_201111", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201111", ["cid"], :name => "cid"

  create_table "session_account_6_201112", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201112", ["cid"], :name => "cid"

  create_table "session_account_6_201201", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201201", ["cid"], :name => "cid"

  create_table "session_account_6_201202", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201202", ["cid"], :name => "cid"

  create_table "session_account_6_201203", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201203", ["cid"], :name => "cid"

  create_table "session_account_6_201204", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201204", ["cid"], :name => "cid"

  create_table "session_account_6_201205", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201205", ["cid"], :name => "cid"

  create_table "session_account_6_201206", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201206", ["cid"], :name => "cid"

  create_table "session_account_6_201207", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201207", ["cid"], :name => "cid"

  create_table "session_account_6_201208", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201208", ["cid"], :name => "cid"

  create_table "session_account_6_201209", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201209", ["cid"], :name => "cid"

  create_table "session_account_6_201210", :id => false, :force => true do |t|
    t.integer "cid",                      :null => false
    t.integer "session_id",               :null => false
    t.integer "sid",                      :null => false
    t.float   "summa",      :limit => 10, :null => false
  end

  add_index "session_account_6_201210", ["cid"], :name => "cid"

  create_table "session_detail_6_201009", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201009", ["cid"], :name => "cid"

  create_table "session_detail_6_201010", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201010", ["cid"], :name => "cid"

  create_table "session_detail_6_201011", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201011", ["cid"], :name => "cid"

  create_table "session_detail_6_201012", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201012", ["cid"], :name => "cid"

  create_table "session_detail_6_201101", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201101", ["cid"], :name => "cid"

  create_table "session_detail_6_201102", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201102", ["cid"], :name => "cid"

  create_table "session_detail_6_201103", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201103", ["cid"], :name => "cid"

  create_table "session_detail_6_201104", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201104", ["cid"], :name => "cid"

  create_table "session_detail_6_201105", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201105", ["cid"], :name => "cid"

  create_table "session_detail_6_201106", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201106", ["cid"], :name => "cid"

  create_table "session_detail_6_201107", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201107", ["cid"], :name => "cid"

  create_table "session_detail_6_201108", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201108", ["cid"], :name => "cid"

  create_table "session_detail_6_201109", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201109", ["cid"], :name => "cid"

  create_table "session_detail_6_201110", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201110", ["cid"], :name => "cid"

  create_table "session_detail_6_201111", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201111", ["cid"], :name => "cid"

  create_table "session_detail_6_201112", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201112", ["cid"], :name => "cid"

  create_table "session_detail_6_201201", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201201", ["cid"], :name => "cid"

  create_table "session_detail_6_201202", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201202", ["cid"], :name => "cid"

  create_table "session_detail_6_201203", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201203", ["cid"], :name => "cid"

  create_table "session_detail_6_201204", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201204", ["cid"], :name => "cid"

  create_table "session_detail_6_201205", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201205", ["cid"], :name => "cid"

  create_table "session_detail_6_201206", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201206", ["cid"], :name => "cid"

  create_table "session_detail_6_201207", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201207", ["cid"], :name => "cid"

  create_table "session_detail_6_201208", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201208", ["cid"], :name => "cid"

  create_table "session_detail_6_201209", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201209", ["cid"], :name => "cid"

  create_table "session_detail_6_201210", :id => false, :force => true do |t|
    t.integer  "session_id",              :null => false
    t.integer  "sid",                     :null => false
    t.integer  "cid",                     :null => false
    t.datetime "dtime",                   :null => false
    t.integer  "amount",     :limit => 8, :null => false
  end

  add_index "session_detail_6_201210", ["cid"], :name => "cid"

  create_table "setup", :force => true do |t|
    t.string "value", :default => "", :null => false
  end

  create_table "sms", :force => true do |t|
    t.datetime "time",       :null => false
    t.integer  "cid",        :null => false
    t.integer  "smstype_id", :null => false
  end

  create_table "smstypes", :force => true do |t|
    t.string "title", :limit => 64, :null => false
  end

  create_table "source", :force => true do |t|
    t.integer  "mid",                        :default => 0,  :null => false
    t.string   "title",       :limit => 20,  :default => "", :null => false
    t.date     "date1"
    t.date     "date2"
    t.string   "comment",                    :default => "", :null => false
    t.integer  "source_type", :limit => 1,   :default => 0,  :null => false
    t.string   "host_or_dir", :limit => 250,                 :null => false
    t.string   "user",        :limit => 15,  :default => "", :null => false
    t.string   "pswd",        :limit => 15,  :default => "", :null => false
    t.text     "config",                                     :null => false
    t.datetime "lm",                                         :null => false
  end

  add_index "source", ["date1"], :name => "date1"
  add_index "source", ["date2"], :name => "date2"
  add_index "source", ["mid"], :name => "mid"

  create_table "sql_patches_history", :primary_key => "mid", :force => true do |t|
    t.text "versions"
  end

  create_table "sql_template", :force => true do |t|
    t.integer "user_id",                :null => false
    t.string  "title",   :limit => 150, :null => false
    t.text    "text",                   :null => false
  end

  create_table "status_log", :id => false, :force => true do |t|
    t.datetime "from_date",                              :null => false
    t.datetime "to_date"
    t.integer  "cid",                    :default => 0,  :null => false
    t.integer  "mid",                    :default => 0,  :null => false
    t.integer  "status",    :limit => 1
    t.integer  "uid",       :limit => 1, :default => 0,  :null => false
    t.string   "comment",                :default => "", :null => false
  end

  add_index "status_log", ["cid"], :name => "cid_index"
  add_index "status_log", ["from_date", "cid", "mid"], :name => "main_from_index", :unique => true
  add_index "status_log", ["from_date"], :name => "from_date_index"
  add_index "status_log", ["to_date", "cid", "mid"], :name => "main_to_index", :unique => true
  add_index "status_log", ["to_date"], :name => "to_date_index"

  create_table "subscr_contact", :force => true do |t|
    t.integer "cid",                   :default => 0,  :null => false
    t.string  "name",    :limit => 50, :default => "", :null => false
    t.string  "email",   :limit => 50, :default => "", :null => false
    t.string  "subject", :limit => 50, :default => "", :null => false
  end

  create_table "tariff_change_task", :force => true do |t|
    t.integer  "cid",       :default => 0, :null => false
    t.integer  "tpid",      :default => 0, :null => false
    t.date     "from_date"
    t.datetime "ex_time"
  end

  add_index "tariff_change_task", ["cid"], :name => "cid"
  add_index "tariff_change_task", ["ex_time"], :name => "ex_time"

  create_table "tariff_detail_6_201009", :id => false, :force => true do |t|
    t.integer "cid",                       :null => false
    t.integer "cost_type_id",              :null => false
    t.integer "amount",       :limit => 8, :null => false
    t.float   "cost",                      :null => false
  end

  add_index "tariff_detail_6_201009", ["cid"], :name => "cid"

  create_table "tariff_detail_6_201206", :id => false, :force => true do |t|
    t.integer "cid",                                                      :null => false
    t.integer "sid",                                                      :null => false
    t.integer "cost_type_id",                                             :null => false
    t.integer "amount",       :limit => 8,                                :null => false
    t.decimal "cost",                      :precision => 12, :scale => 5, :null => false
  end

  add_index "tariff_detail_6_201206", ["cid"], :name => "cid"

  create_table "tariff_group", :force => true do |t|
    t.string  "title", :limit => 200, :default => "", :null => false
    t.integer "tm",    :limit => 1,   :default => 0,  :null => false
    t.integer "df",                   :default => 0,  :null => false
    t.integer "beh",                  :default => 0,  :null => false
    t.integer "pos",                                  :null => false
  end

  create_table "tariff_group_tariff", :id => false, :force => true do |t|
    t.integer "tgid",  :default => 0, :null => false
    t.integer "tpid",  :default => 0, :null => false
    t.date    "date1"
    t.date    "date2"
  end

  add_index "tariff_group_tariff", ["tgid"], :name => "tgid"

  create_table "tariff_option", :force => true do |t|
    t.string  "title",                        :limit => 250,                 :null => false
    t.text    "tariff_ids",                                                  :null => false
    t.string  "comment",                      :limit => 250,                 :null => false
    t.date    "date1"
    t.date    "date2"
    t.string  "depends",                                     :default => "", :null => false
    t.string  "incompatible",                                :default => "", :null => false
    t.integer "contract_groups",              :limit => 8,   :default => 0,  :null => false
    t.integer "hideForWeb",                   :limit => 2,   :default => 0,  :null => false
    t.integer "hideForWebContractGroups",     :limit => 8,   :default => 0,  :null => false
    t.integer "hideForWebContractGroupsMode", :limit => 2,   :default => 0,  :null => false
    t.text    "description",                                                 :null => false
  end

  create_table "tariff_option_activate_mode", :force => true do |t|
    t.integer "option_id",                                                        :null => false
    t.integer "charge_type_id",                                                   :null => false
    t.decimal "charge_summa",      :precision => 10, :scale => 2,                 :null => false
    t.integer "period_mode",                                                      :null => false
    t.integer "period_col",                                                       :null => false
    t.date    "date1"
    t.date    "date2"
    t.integer "deactivation_mode",                                                :null => false
    t.integer "reactivation_mode",                                :default => 0,  :null => false
    t.string  "title",                                            :default => "", :null => false
  end

  add_index "tariff_option_activate_mode", ["option_id"], :name => "option_id"

  create_table "tariff_plan", :force => true do |t|
    t.string   "title",   :limit => 200, :default => "", :null => false
    t.datetime "lm",                                     :null => false
    t.integer  "actual",                 :default => 0,  :null => false
    t.integer  "gr",      :limit => 8,                   :null => false
    t.string   "pattern"
    t.integer  "face",    :limit => 1
    t.integer  "tree_id",                                :null => false
  end

  create_table "tariff_tree", :force => true do |t|
    t.integer "parent_tree", :default => 0, :null => false
  end

  add_index "tariff_tree", ["parent_tree"], :name => "parent"

  create_table "tariff_tree_config", :primary_key => "module", :force => true do |t|
    t.text "data", :limit => 2147483647, :null => false
  end

  create_table "tariff_tree_link", :primary_key => "tpid", :force => true do |t|
    t.integer "tree_id", :default => 0, :null => false
  end

  create_table "task_load", :force => true do |t|
    t.string   "title", :limit => 200, :default => "", :null => false
    t.datetime "dt",                                   :null => false
    t.integer  "param",                :default => 0,  :null => false
    t.integer  "count",                :default => 0,  :null => false
    t.datetime "le",                                   :null => false
  end

  add_index "task_load", ["le"], :name => "le"

  create_table "task_proccess", :force => true do |t|
    t.integer  "mid",                               :default => 0,  :null => false
    t.string   "title",              :limit => 200, :default => "", :null => false
    t.datetime "dt",                                                :null => false
    t.integer  "param",                             :default => 0,  :null => false
    t.datetime "start_process_time"
  end

  add_index "task_proccess", ["start_process_time"], :name => "spt"

  create_table "tasks", :force => true do |t|
    t.string   "title",        :limit => 120,  :null => false
    t.string   "text",         :limit => 1000, :null => false
    t.integer  "user_id",                      :null => false
    t.integer  "tstatus_id",                   :null => false
    t.integer  "take_id"
    t.time     "end_at"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "observers",                    :null => false
    t.integer  "contract_cid"
  end

  create_table "tcomments", :force => true do |t|
    t.string   "text",       :limit => 360, :null => false
    t.integer  "user_id",                   :null => false
    t.integer  "task_id",                   :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "tfiles", :force => true do |t|
    t.string   "title",             :limit => 120, :null => false
    t.string   "file_file_name",                   :null => false
    t.string   "file_content_type",                :null => false
    t.string   "file_file_size",                   :null => false
    t.integer  "task_id",                          :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "time_type", :force => true do |t|
    t.string "title", :limit => 100, :null => false
    t.text   "data",                 :null => false
  end

  create_table "tstatuses", :force => true do |t|
    t.string "title", :limit => 120, :null => false
  end

  create_table "user", :force => true do |t|
    t.string   "login",        :limit => 15,  :default => "", :null => false
    t.string   "name",         :limit => 50,  :default => "", :null => false
    t.string   "descr",                       :default => "", :null => false
    t.string   "pswd",         :limit => 32
    t.datetime "dt",                                          :null => false
    t.string   "laf",          :limit => 100, :default => "", :null => false
    t.integer  "gr",           :limit => 8,                   :null => false
    t.integer  "status",       :limit => 1,   :default => 0,  :null => false
    t.integer  "cgr",          :limit => 8,   :default => 0,  :null => false
    t.string   "pids",         :limit => 120
    t.integer  "contract_pid",                :default => 0,  :null => false
    t.integer  "contract_cid",                :default => 0,  :null => false
    t.text     "config",                                      :null => false
    t.integer  "crm_user_id",                                 :null => false
    t.integer  "cgr_mode",     :limit => 1,   :default => 1,  :null => false
    t.string   "email",        :limit => 50,                  :null => false
  end

  add_index "user", ["login"], :name => "login"

  create_table "user_alias_6", :id => false, :force => true do |t|
    t.integer "login_id",                   :default => 0,  :null => false
    t.string  "login_alias", :limit => 128, :default => "", :null => false
  end

  add_index "user_alias_6", ["login_alias"], :name => "alias_not_u"
  add_index "user_alias_6", ["login_id"], :name => "login_id"

  create_table "user_dispatch", :force => true do |t|
    t.integer "cid",                   :default => 0,  :null => false
    t.string  "mails",  :limit => 200, :default => "", :null => false
    t.integer "type",                  :default => 0,  :null => false
    t.string  "params",                :default => "", :null => false
    t.string  "title",  :limit => 100, :default => "", :null => false
    t.integer "status", :limit => 1,   :default => 0,  :null => false
  end

  add_index "user_dispatch", ["cid"], :name => "cid"

  create_table "user_dispatch_reference", :force => true do |t|
    t.integer "mid",                              :default => 0
    t.string  "module",            :limit => 30,  :default => "", :null => false
    t.string  "title",             :limit => 100, :default => "", :null => false
    t.string  "class_name",        :limit => 200, :default => "", :null => false
    t.string  "web_action",        :limit => 200, :default => "", :null => false
    t.string  "client_class_name", :limit => 200,                 :null => false
  end

  add_index "user_dispatch_reference", ["mid"], :name => "mid"

  create_table "user_group", :primary_key => "gr_code", :force => true do |t|
    t.string "gr_name", :limit => 60, :default => "0"
  end

  create_table "user_group_access", :id => false, :force => true do |t|
    t.integer "gr_code", :limit => 2, :default => 0, :null => false
    t.integer "ma_id",   :limit => 2, :default => 0, :null => false
  end

  add_index "user_group_access", ["gr_code", "ma_id"], :name => "gr_code"

  create_table "user_group_entry", :id => false, :force => true do |t|
    t.integer "gr_code",        :limit => 2, :default => 0, :null => false
    t.integer "parent_gr_code", :limit => 2, :default => 0, :null => false
  end

  add_index "user_group_entry", ["gr_code", "parent_gr_code"], :name => "gr_code"

  create_table "user_group_member", :id => false, :force => true do |t|
    t.integer "user_id", :limit => 2, :default => 0
    t.integer "gr_code", :limit => 2, :default => 0
  end

  add_index "user_group_member", ["user_id", "gr_code"], :name => "user_id"

  create_table "user_login_6", :force => true do |t|
    t.integer "cid",                       :default => 0,  :null => false
    t.integer "object_id",                 :default => 0,  :null => false
    t.integer "login",                     :default => 0,  :null => false
    t.string  "pswd",        :limit => 32, :default => "", :null => false
    t.date    "date1"
    t.date    "date2"
    t.integer "status",      :limit => 1,  :default => 0,  :null => false
    t.integer "session",     :limit => 2,  :default => 0,  :null => false
    t.integer "rp_mode",     :limit => 1,  :default => 0,  :null => false
    t.string  "realm_group", :limit => 20, :default => "", :null => false
    t.string  "comment",                   :default => "", :null => false
  end

  add_index "user_login_6", ["cid"], :name => "cid"
  add_index "user_login_6", ["date1"], :name => "date1"
  add_index "user_login_6", ["date2"], :name => "date2"
  add_index "user_login_6", ["login"], :name => "login_not_u"
  add_index "user_login_6", ["object_id"], :name => "object_id"

  create_table "user_login_condition_6", :id => false, :force => true do |t|
    t.integer "llid", :default => 0, :null => false
    t.integer "hh",   :default => 0, :null => false
    t.integer "dw",   :default => 0, :null => false
    t.integer "dm",   :default => 0, :null => false
    t.integer "mm",   :default => 0, :null => false
  end

  add_index "user_login_condition_6", ["llid"], :name => "llid"

  create_table "user_login_limit_6", :force => true do |t|
    t.integer "num",                     :default => 0
    t.integer "lid",                     :default => 0,  :null => false
    t.integer "sid",                     :default => 0,  :null => false
    t.string  "param1",   :limit => 250, :default => "", :null => false
    t.string  "param2",   :limit => 250, :default => "", :null => false
    t.date    "date1"
    t.date    "date2"
    t.string  "comment",                 :default => "", :null => false
    t.integer "type_con",                :default => 0,  :null => false
  end

  add_index "user_login_limit_6", ["lid"], :name => "lid"

  create_table "user_menu", :id => false, :force => true do |t|
    t.integer "uid",                   :null => false
    t.string  "menu_id", :limit => 50, :null => false
    t.integer "hidden",  :limit => 1,  :null => false
  end

  create_table "user_module_action", :force => true do |t|
    t.string  "module",      :limit => 30,  :default => "0", :null => false
    t.integer "type",                       :default => 0,   :null => false
    t.string  "action",      :limit => 40,  :default => "0", :null => false
    t.string  "description", :limit => 120, :default => "0"
  end

  add_index "user_module_action", ["module", "action"], :name => "module_action"

  create_table "user_tables", :id => false, :force => true do |t|
    t.integer "userId"
    t.string  "table_module", :limit => 100
    t.string  "table_id",     :limit => 100
    t.text    "widths"
    t.text    "positions"
    t.text    "hiddens"
  end

  add_index "user_tables", ["table_module"], :name => "table_module"
  add_index "user_tables", ["userId"], :name => "userId"

  create_table "user_user_access", :id => false, :force => true do |t|
    t.integer "user_id", :limit => 2, :default => 0, :null => false
    t.integer "ma_id",   :limit => 2, :default => 0
  end

  add_index "user_user_access", ["user_id", "ma_id"], :name => "user_id_2"

  create_table "web_request_count", :id => false, :force => true do |t|
    t.integer "cid",   :default => 0, :null => false
    t.date    "date",                 :null => false
    t.integer "count", :default => 0, :null => false
  end

  add_index "web_request_count", ["cid"], :name => "cid", :unique => true

  create_table "web_request_limit", :primary_key => "cid", :force => true do |t|
    t.integer "lim"
  end

end
