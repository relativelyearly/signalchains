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

ActiveRecord::Schema.define(:version => 20091218191603) do

  create_table "audios", :force => true do |t|
    t.string   "status",            :default => "converting"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "audible_id"
    t.string   "audible_type"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "chain_gears", :force => true do |t|
    t.integer  "gear_id"
    t.string   "gear_type"
    t.integer  "chain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
    t.integer  "position",   :default => 2
  end

  create_table "chains", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.string   "name"
    t.text     "notes"
    t.string   "title"
    t.string   "performer"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "likes_count",    :default => 0
    t.integer  "comments_count", :default => 0
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dynamics_processors", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "circuitry"
    t.string   "compression_type"
    t.string   "dynamics_type"
    t.string   "interface"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count",     :default => 0
  end

  create_table "effects_processors", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "effects_type"
    t.string   "interface"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count",     :default => 0
  end

  create_table "equalizers", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "equalizer_type"
    t.integer  "bands"
    t.string   "interface"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count",     :default => 0
  end

  create_table "follows", :force => true do |t|
    t.integer  "user_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer  "chain_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mics", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "mic_type"
    t.string   "diaphragm_size"
    t.string   "pattern"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count",     :default => 0
  end

  create_table "preamps", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "circuitry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count",     :default => 0
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["context", "taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "timeline_events", :force => true do |t|
    t.string   "event_type"
    t.string   "subject_type"
    t.string   "actor_type"
    t.string   "secondary_subject_type"
    t.integer  "subject_id"
    t.integer  "actor_id"
    t.integer  "secondary_subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "email"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "display_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "slug"
    t.string   "login"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
