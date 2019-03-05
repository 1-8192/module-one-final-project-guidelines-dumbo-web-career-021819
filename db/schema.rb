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

ActiveRecord::Schema.define(version: 7) do

  create_table "character_classes", force: :cascade do |t|
    t.string "class_name"
    t.string "description"
    t.string "spellcasting"
  end

  create_table "spell_slot", force: :cascade do |t|
    t.integer "spell_id"
    t.integer "character_class_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.integer "level"
    t.string  "school"
    t.string  "classes"
  end

end
