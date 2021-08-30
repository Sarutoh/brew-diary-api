# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_829_225_839) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'brew_sessions', force: :cascade do |t|
    t.string 'title', null: false
    t.integer 'volume', null: false
    t.text 'description'
    t.string 'image_url'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_brew_sessions_on_user_id'
  end

  create_table 'hops', force: :cascade do |t|
    t.string 'title'
    t.float 'weight'
    t.bigint 'brew_session_id'
    t.index ['brew_session_id'], name: 'index_hops_on_brew_session_id'
  end

  create_table 'ingredients', force: :cascade do |t|
    t.string 'title', null: false
    t.float 'weight'
    t.integer 'pieces'
    t.string 'image_url'
    t.bigint 'brew_session_id'
    t.index ['brew_session_id'], name: 'index_ingredients_on_brew_session_id'
  end

  create_table 'mash_steps', force: :cascade do |t|
    t.integer 'temperature', null: false
    t.integer 'duration', null: false
    t.bigint 'brew_session_id', null: false
    t.index ['brew_session_id'], name: 'index_mash_steps_on_brew_session_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.text 'authentication_token'
    t.datetime 'authentication_token_created_at'
    t.index ['authentication_token'], name: 'index_users_on_authentication_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'brew_sessions', 'users'
  add_foreign_key 'mash_steps', 'brew_sessions'
end
