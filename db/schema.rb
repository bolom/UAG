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

ActiveRecord::Schema.define(:version => 36) do

  create_table "contributions", :force => true do |t|
    t.decimal "enseignement_id"
    t.decimal "enseignant_id"
  end

  create_table "couriels", :force => true do |t|
    t.string  "email"
    t.integer "mailling_list_id"
  end

  create_table "documents", :force => true do |t|
    t.string  "content_type"
    t.string  "filename"
    t.integer "size"
    t.integer "parent_id"
    t.string  "thumbnail"
    t.integer "db_file_id"
    t.integer "groupe_document_id", :default => 0
    t.string  "description"
    t.string  "description_en"
  end

  create_table "enseignants", :force => true do |t|
    t.string  "nom"
    t.string  "prenom"
    t.string  "photo"
    t.string  "email"
    t.string  "telephone"
    t.text    "recherche"
    t.text    "publication"
    t.text    "personal"
    t.string  "groupe"
    t.string  "fonction"
    t.string  "adresse"
    t.text    "recherche_en",   :default => ""
    t.text    "publication_en", :default => ""
    t.text    "personal_en",    :default => ""
    t.integer "parent_id"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
    t.string  "fonction_en"
  end

  create_table "enseignements", :force => true do |t|
    t.string   "libelle"
    t.string   "volume"
    t.string   "heures_perso"
    t.string   "ects"
    t.text     "question"
    t.text     "objectif"
    t.text     "bibliographie"
    t.text     "evaluation"
    t.text     "remarque"
    t.text     "plan"
    t.text     "contenu"
    t.string   "type"
    t.datetime "updated_at"
    t.string   "modifier_par"
    t.string   "annee"
    t.text     "libelle_en",         :default => ""
    t.string   "contenu_en",         :default => ""
    t.text     "question_en",        :default => ""
    t.text     "objectif_en",        :default => ""
    t.text     "plan_en",            :default => ""
    t.text     "bibliographie_en",   :default => ""
    t.text     "evaluation_en",      :default => ""
    t.text     "remarque_en",        :default => ""
    t.integer  "groupe_document_id"
    t.string   "last_udptated"
  end

  create_table "groupe_documents", :force => true do |t|
    t.string "label"
    t.string "label_en", :default => "NULL"
  end

  create_table "groupements", :force => true do |t|
    t.integer "groupe_id"
    t.integer "enseignement_id"
  end

  create_table "groupes", :force => true do |t|
    t.string "title"
    t.string "type_groupe"
    t.string "title_en",    :default => "text1"
  end

  create_table "mailling_lists", :force => true do |t|
    t.string "label"
  end

  create_table "parcours", :force => true do |t|
    t.string "title"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"
  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"

  create_table "universites", :force => true do |t|
    t.string  "name"
    t.string  "students"
    t.text    "definition"
    t.text    "remarque"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
    t.string  "link"
    t.string  "name_en",       :default => ""
    t.text    "definition_en", :default => ""
    t.string  "students_en",   :default => ""
    t.text    "remarque_en",   :default => ""
    t.string  "link_en"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "user_id"
    t.integer  "enseignant_id"
    t.string   "role"
  end

end
