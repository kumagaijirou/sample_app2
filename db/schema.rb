# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_07_205054) do
  create_table "tasks", force: :cascade do |t|
    t.text "task_content"
    t.integer "task_user_ID"
    t.integer "task_bet_user_ID"
    t.datetime "task_deadline_at"
    t.integer "Amount_bet"
    t.boolean "Task_success_failure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_user_ID", "created_at"], name: "index_Tasks_on_task_user_id_and_created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.text "profile"
    t.integer "dice_point"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
