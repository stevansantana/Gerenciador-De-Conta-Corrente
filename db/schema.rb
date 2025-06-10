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

ActiveRecord::Schema[8.0].define(version: 2025_06_09_143642) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "correntistas", force: :cascade do |t|
    t.string "nome"
    t.string "conta_corrente"
    t.string "senha"
    t.string "perfil"
    t.decimal "saldo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transacaos", force: :cascade do |t|
    t.bigint "correntista_id", null: false
    t.string "tipo"
    t.string "descricao"
    t.decimal "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correntista_id"], name: "index_transacaos_on_correntista_id"
  end

  create_table "visita_gerentes", force: :cascade do |t|
    t.bigint "correntista_id", null: false
    t.boolean "confirmado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correntista_id"], name: "index_visita_gerentes_on_correntista_id"
  end

  add_foreign_key "transacaos", "correntistas"
  add_foreign_key "visita_gerentes", "correntistas"
end
