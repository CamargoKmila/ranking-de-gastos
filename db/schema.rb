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

ActiveRecord::Schema.define(version: 2021_03_07_202807) do

  create_table "costs", force: :cascade do |t|
    t.string "txtDescricao"
    t.string "txtFornecedor"
    t.string "txtCNPJCPF"
    t.datetime "datEmissao"
    t.decimal "vlrLiquido"
    t.string "urlDocumento"
    t.integer "deputy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deputy_id"], name: "index_costs_on_deputy_id"
  end

  create_table "deputies", force: :cascade do |t|
    t.string "txNomeParlamentar"
    t.integer "ideCadastro"
    t.string "nuCarteiraParlamentar"
    t.string "cpf"
    t.string "sgUF", limit: 2
    t.string "sgPartido", limit: 255
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ideCadastro"], name: "index_deputies_on_ideCadastro"
  end

  add_foreign_key "costs", "deputies"
end
