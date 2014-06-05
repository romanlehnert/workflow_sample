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

ActiveRecord::Schema.define(version: 20140505120302) do

  create_table "contracts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contracts", ["user_id"], name: "index_contracts_on_user_id"

  create_table "hooks", force: true do |t|
    t.string   "occurance"
    t.string   "service"
    t.string   "params"
    t.integer  "transition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_hooks", force: true do |t|
    t.string   "service"
    t.string   "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.integer  "workflow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "initial"
  end

  add_index "states", ["workflow_id"], name: "index_states_on_workflow_id"

  create_table "transitions", force: true do |t|
    t.integer  "origin_id"
    t.integer  "target_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workflow_memberships", force: true do |t|
    t.integer  "workflow_id"
    t.integer  "state_id"
    t.string   "workflow_membershippable_type"
    t.integer  "workflow_membershippable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workflows", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
