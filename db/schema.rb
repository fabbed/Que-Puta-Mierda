# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090603143029) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "changes", :force => true do |t|
    t.string   "label"
    t.text     "description"
    t.date     "change_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.datetime "created_at",                                     :null => false
    t.integer  "commentable_id",                 :default => 0,  :null => false
    t.string   "commentable_type", :limit => 15, :default => "", :null => false
    t.integer  "user_id",                        :default => 0,  :null => false
  end

  create_table "newsletter_registrations", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pageviews", :force => true do |t|
    t.integer  "user_id"
    t.string   "request_uri",                        :null => false
    t.string   "request_method",       :limit => 7,  :null => false
    t.string   "referer"
    t.string   "session",                            :null => false
    t.string   "ip_address",           :limit => 15, :null => false
    t.string   "user_agent"
    t.string   "http_accept"
    t.string   "http_accept_language"
    t.string   "http_accept_encoding"
    t.string   "search_engine",        :limit => 15
    t.string   "search_terms"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pageviews", ["ip_address"], :name => "index_pageviews_on_ip_address"
  add_index "pageviews", ["session"], :name => "index_pageviews_on_session"
  add_index "pageviews", ["user_id"], :name => "index_pageviews_on_user_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_name_and_sluggable_type_and_scope_and_sequence", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "stories", :force => true do |t|
    t.text     "body"
    t.string   "email"
    t.integer  "rated_top",                   :default => 0
    t.integer  "rated_flop",                  :default => 0
    t.boolean  "anonymous",                   :default => true
    t.boolean  "on_startpage",                :default => false
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "seo_title"
    t.string   "title",        :limit => 100
    t.boolean  "administered",                :default => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.boolean  "wants_newsletter",                        :default => true
    t.integer  "country_id"
    t.boolean  "admin",                                   :default => false
  end

end
