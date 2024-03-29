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

ActiveRecord::Schema.define(version: 20_220_521_080_256) do
  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at', precision: 6
    t.index %w[slug sluggable_type scope], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope',
                                           unique: true
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type'
    t.index %w[sluggable_type sluggable_id], name: 'index_friendly_id_slugs_on_sluggable_type_and_sluggable_id'
  end

  create_table 'hashtag_links', force: :cascade do |t|
    t.integer 'question_id'
    t.integer 'hashtag_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['hashtag_id'], name: 'index_hashtag_links_on_hashtag_id'
    t.index ['question_id'], name: 'index_hashtag_links_on_question_id'
  end

  create_table 'hashtags', force: :cascade do |t|
    t.string 'text', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'slug'
    t.index ['slug'], name: 'index_hashtags_on_slug', unique: true
    t.index ['text'], name: 'index_hashtags_on_text', unique: true
  end

  create_table 'questions', force: :cascade do |t|
    t.text 'body'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'hidden', default: false, null: false
    t.text 'answer'
    t.integer 'author_id'
    t.index ['author_id'], name: 'index_questions_on_author_id'
    t.index ['user_id'], name: 'index_questions_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'nickname'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'password_digest'
    t.string 'color', default: '#370617'
    t.string 'slug'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['nickname'], name: 'index_users_on_nickname', unique: true
    t.index ['slug'], name: 'index_users_on_slug', unique: true
  end
end
