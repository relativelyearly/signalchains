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

ActiveRecord::Schema.define(:version => 20091112024419) do

  create_table "chain_gears", :force => true do |t|
    t.integer  "gear_id"
    t.string   "gear_type"
    t.integer  "chain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chains", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.string   "name"
    t.text     "notes"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.string   "title"
    t.string   "performer"
    t.string   "year"
    t.string   "studio"
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
  end

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
  end

end
