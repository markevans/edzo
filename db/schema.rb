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

ActiveRecord::Schema.define(version: 20140108173133) do

  create_table "people", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_taggings", force: true do |t|
    t.integer  "person_id"
    t.integer  "person_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_taggings", ["person_id"], name: "index_person_taggings_on_person_id"
  add_index "person_taggings", ["person_tag_id"], name: "index_person_taggings_on_person_tag_id"

  create_table "person_tags", force: true do |t|
    t.string   "name"
    t.string   "colour"
    t.integer  "person_tagging_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_tags", ["person_tagging_id"], name: "index_person_tags_on_person_tagging_id"

  create_table "relationship_tags", force: true do |t|
    t.string   "name"
    t.string   "colour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "person_1_id"
    t.integer  "person_2_id"
    t.integer  "tag_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["person_1_id"], name: "index_relationships_on_person_1_id"
  add_index "relationships", ["person_2_id"], name: "index_relationships_on_person_2_id"
  add_index "relationships", ["tag_id"], name: "index_relationships_on_tag_id"

end
