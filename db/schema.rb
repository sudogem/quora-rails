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

ActiveRecord::Schema.define(version: 20160423143202) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",              limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree

  create_table "bookmarks", force: :cascade do |t|
    t.string   "bookmarkable_type", limit: 255
    t.integer  "bookmarkable_id",   limit: 4
    t.integer  "user_id",           limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bookmarks", ["bookmarkable_type", "bookmarkable_id"], name: "index_bookmarks_on_bookmarkable_type_and_bookmarkable_id", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "interests", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "tag_id",      limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "interests", ["follower_id", "tag_id"], name: "index_interests_on_follower_id_and_tag_id", unique: true, using: :btree
  add_index "interests", ["follower_id"], name: "index_interests_on_follower_id", using: :btree
  add_index "interests", ["tag_id"], name: "index_interests_on_tag_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.string   "likeable_type", limit: 255
    t.integer  "likeable_id",   limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "likes", ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id",    limit: 4
    t.integer  "actor_id",        limit: 4
    t.string   "action",          limit: 255
    t.datetime "read_at"
    t.integer  "notifiable_id",   limit: 4
    t.string   "notifiable_type", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "is_new",                      default: false
  end

  add_index "notifications", ["actor_id"], name: "index_notifications_on_actor_id", using: :btree
  add_index "notifications", ["recipient_id"], name: "index_notifications_on_recipient_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.text     "body",            limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "user_id",         limit: 4
    t.string   "picture",         limit: 255
    t.integer  "likes_count",     limit: 4,     default: 0
    t.datetime "published_at"
    t.boolean  "featured",                      default: false
    t.text     "lead",            limit: 65535
    t.string   "slug",            limit: 255
    t.integer  "responses_count", limit: 4,     default: 0,     null: false
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.text     "body",        limit: 65535
    t.integer  "post_id",     limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "likes_count", limit: 4,     default: 0
  end

  add_index "responses", ["post_id"], name: "index_responses_on_post_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "tag_relationships", force: :cascade do |t|
    t.integer  "tag_id",         limit: 4,             null: false
    t.integer  "related_tag_id", limit: 4,             null: false
    t.integer  "relevance",      limit: 4, default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "tag_relationships", ["related_tag_id"], name: "index_tag_relationships_on_related_tag_id", using: :btree
  add_index "tag_relationships", ["tag_id", "related_tag_id"], name: "index_tag_relationships_on_tag_id_and_related_tag_id", unique: true, using: :btree
  add_index "tag_relationships", ["tag_id"], name: "index_tag_relationships_on_tag_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "taggings", ["post_id"], name: "index_taggings_on_post_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "featured",                   default: false
    t.string   "slug",           limit: 255
    t.string   "lowercase_name", limit: 255
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree
  add_index "tags", ["slug"], name: "index_tags_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "username",               limit: 255
    t.text     "description",            limit: 65535
    t.string   "avatar",                 limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "slug",                   limit: 255
    t.string   "location",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  add_foreign_key "bookmarks", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "responses", "posts"
  add_foreign_key "responses", "users"
  add_foreign_key "taggings", "posts"
  add_foreign_key "taggings", "tags"
end
