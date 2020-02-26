# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_26_040956) do

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "permalink"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemonnests", force: :cascade do |t|
    t.string "historicalName"
    t.string "streetName"
    t.string "streetNumber"
    t.string "grade"
    t.string "constructionDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "latitude"
    t.string "longitude"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "move"
    t.integer "pokemonnest_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemonnest_id"], name: "index_pokemons_on_pokemonnest_id"
  end

  create_table "pokemonwaves", force: :cascade do |t|
    t.integer "request_id", null: false
    t.integer "pokemon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_pokemonwaves_on_pokemon_id"
    t.index ["request_id"], name: "index_pokemonwaves_on_request_id"
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "date"
    t.string "serviceArea"
    t.string "serviceRequest"
    t.string "neighbourhood"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "latitude"
    t.string "longitude"
  end

  add_foreign_key "pokemons", "pokemonnests"
  add_foreign_key "pokemonwaves", "pokemons"
  add_foreign_key "pokemonwaves", "requests"
end
