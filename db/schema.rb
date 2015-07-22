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

ActiveRecord::Schema.define(version: 20150505172429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "unaccent"

  create_table "annotations", force: true do |t|
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_id"
    t.integer  "entity_id"
  end

  add_index "annotations", ["entity_id"], name: "index_annotations_on_entity_id", using: :btree
  add_index "annotations", ["photo_id"], name: "index_annotations_on_photo_id", using: :btree

  create_table "entities", force: true do |t|
    t.string   "name",                                           null: false
    t.string   "description",          limit: 90
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "priority",             limit: 1,                 null: false
    t.string   "short_name"
    t.string   "twitter_handle"
    t.string   "wikipedia_page"
    t.string   "facebook_page"
    t.string   "flickr_page"
    t.string   "linkedin_page"
    t.text     "notes"
    t.string   "slug"
    t.boolean  "person",                          default: true, null: false
    t.boolean  "published",                       default: true, null: false
    t.boolean  "needs_work",                      default: true, null: false
    t.string   "avatar"
    t.string   "web_page"
    t.string   "open_corporates_page"
    t.string   "youtube_page"
    t.date     "birth_date"
    t.string   "occupation"
    t.integer  "attendance"
    t.string   "club_name"
    t.string   "pesel"
    t.datetime "imported_at"
    t.string   "krs"
    t.string   "nip"
    t.string   "regon"
    t.boolean  "is_order"
  end

  add_index "entities", ["person"], name: "index_entities_on_person", using: :btree
  add_index "entities", ["published"], name: "index_entities_on_published", using: :btree
  add_index "entities", ["slug"], name: "index_entities_on_slug", using: :btree

  create_table "facts", force: true do |t|
    t.string "importer"
    t.hstore "properties"
  end

  add_index "facts", ["properties"], name: "index_facts_on_properties", using: :btree

  create_table "facts_relations", force: true do |t|
    t.integer "relation_id"
    t.integer "fact_id"
  end

  add_index "facts_relations", ["fact_id"], name: "index_facts_relations_on_fact_id", using: :btree
  add_index "facts_relations", ["relation_id"], name: "index_facts_relations_on_relation_id", using: :btree

  create_table "import_blacklists", force: true do |t|
    t.string   "object_type"
    t.string   "object_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "import_blacklists", ["object_type", "object_name"], name: "index_import_blacklists_on_object_type_and_object_name", unique: true, using: :btree

  create_table "mentions", force: true do |t|
    t.integer "post_id"
    t.integer "mentionee_id"
    t.string  "mentionee_type"
  end

  add_index "mentions", ["mentionee_id", "mentionee_type"], name: "index_mentions_on_mentionee_id_and_mentionee_type", using: :btree
  add_index "mentions", ["post_id"], name: "index_mentions_on_post_id", using: :btree

  create_table "mojepanstwo_pl_deputies", force: true do |t|
    t.string   "_id"
    t.string   "_mpurl"
    t.boolean  "mandat_wygasl",                null: false
    t.string   "sejm_kluby_nazwa", limit: 128
    t.string   "sejm_kluby_skrot", limit: 32
    t.string   "imie_pierwsze",    limit: 64,  null: false
    t.string   "imie_drugie",      limit: 64
    t.string   "nazwisko",         limit: 64,  null: false
    t.string   "plec",             limit: 1
    t.integer  "krs_osoba_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data_urodzenia"
    t.integer  "frekwencja"
    t.string   "zawod"
  end

  add_index "mojepanstwo_pl_deputies", ["_id"], name: "index_mojepanstwo_pl_deputies_on__id", unique: true, using: :btree
  add_index "mojepanstwo_pl_deputies", ["_mpurl"], name: "index_mojepanstwo_pl_deputies_on__mpurl", unique: true, using: :btree

  create_table "mojepanstwo_pl_krs_organizations", force: true do |t|
    t.string   "_id"
    t.string   "_mpurl"
    t.string   "nazwa"
    t.integer  "krs"
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mojepanstwo_pl_krs_organizations", ["_id"], name: "index_mojepanstwo_pl_krs_organizations_on__id", unique: true, using: :btree
  add_index "mojepanstwo_pl_krs_organizations", ["_mpurl"], name: "index_mojepanstwo_pl_krs_organizations_on__mpurl", unique: true, using: :btree
  add_index "mojepanstwo_pl_krs_organizations", ["entity_id"], name: "index_mojepanstwo_pl_krs_organizations_on_entity_id", using: :btree
  add_index "mojepanstwo_pl_krs_organizations", ["krs"], name: "index_mojepanstwo_pl_krs_organizations_on_krs", unique: true, using: :btree

  create_table "mojepanstwo_pl_krs_people", force: true do |t|
    t.string   "_id"
    t.string   "_mpurl"
    t.string   "imie_pierwsze", limit: 64
    t.string   "imie_drugie",   limit: 64
    t.string   "nazwisko",      limit: 64
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mojepanstwo_pl_krs_people", ["_id"], name: "index_mojepanstwo_pl_krs_people_on__id", unique: true, using: :btree
  add_index "mojepanstwo_pl_krs_people", ["_mpurl"], name: "index_mojepanstwo_pl_krs_people_on__mpurl", unique: true, using: :btree

  create_table "mojepanstwo_pl_people", force: true do |t|
    t.integer  "krs_person_id"
    t.integer  "deputy_id"
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mojepanstwo_pl_people", ["deputy_id"], name: "index_mojepanstwo_pl_people_on_deputy_id", unique: true, using: :btree
  add_index "mojepanstwo_pl_people", ["entity_id"], name: "index_mojepanstwo_pl_people_on_entity_id", using: :btree
  add_index "mojepanstwo_pl_people", ["krs_person_id"], name: "index_mojepanstwo_pl_people_on_krs_person_id", unique: true, using: :btree

  create_table "mojepanstwo_pl_public_institutions", force: true do |t|
    t.string   "name"
    t.integer  "_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mojepanstwo_pl_public_orders", force: true do |t|
    t.string   "slug"
    t.string   "price"
    t.integer  "status"
    t.integer  "contractor_id"
    t.integer  "procurer_id"
    t.integer  "order_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "mojepanstwo_pl_roles", force: true do |t|
    t.integer  "krs_person_id"
    t.integer  "krs_organization_id"
    t.string   "function"
    t.boolean  "canceled"
    t.integer  "relation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mojepanstwo_pl_roles", ["krs_organization_id"], name: "index_mojepanstwo_pl_roles_on_krs_organization_id", using: :btree
  add_index "mojepanstwo_pl_roles", ["krs_person_id", "krs_organization_id", "function"], name: "unique_role", unique: true, using: :btree
  add_index "mojepanstwo_pl_roles", ["krs_person_id"], name: "index_mojepanstwo_pl_roles_on_krs_person_id", using: :btree
  add_index "mojepanstwo_pl_roles", ["relation_id"], name: "index_mojepanstwo_pl_roles_on_relation_id", using: :btree

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "file"
    t.string   "copyright"
    t.boolean  "published",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "needs_work", default: true,  null: false
    t.text     "footer"
    t.string   "source"
    t.date     "date"
    t.text     "notes"
    t.boolean  "extra_wide"
  end

  add_index "photos", ["published"], name: "index_photos_on_published", using: :btree

  create_table "posts", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.string   "title",                                null: false
    t.boolean  "published",            default: false, null: false
    t.text     "notes"
    t.string   "slug"
    t.boolean  "needs_work",           default: true,  null: false
    t.boolean  "show_photo_as_header", default: false
    t.text     "lead"
    t.integer  "photo_id"
    t.boolean  "featured",             default: false
    t.datetime "published_at"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["photo_id"], name: "index_posts_on_photo_id", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "relation_types", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relations", force: true do |t|
    t.integer  "source_id",                        null: false
    t.integer  "target_id",                        null: false
    t.string   "via"
    t.date     "from"
    t.date     "to"
    t.date     "at"
    t.boolean  "published"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "relation_type_id",                 null: false
    t.string   "via2"
    t.string   "via3"
    t.boolean  "needs_work",       default: false, null: false
  end

  add_index "relations", ["source_id"], name: "index_relations_on_source_id", using: :btree
  add_index "relations", ["target_id"], name: "index_relations_on_target_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
