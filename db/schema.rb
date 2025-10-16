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

ActiveRecord::Schema[7.2].define(version: 2025_10_16_211759) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bairros", force: :cascade do |t|
    t.string "nome"
    t.bigint "municipio_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_bairros_on_municipio_id"
  end

  create_table "categoria_produtos", force: :cascade do |t|
    t.bigint "empresa_id", null: false
    t.string "nome", limit: 100, null: false
    t.text "descricao"
    t.boolean "ativo", default: true
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_categoria_produtos_on_empresa_id"
  end

  create_table "distritos", force: :cascade do |t|
    t.string "nome"
    t.bigint "municipio_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_distritos_on_municipio_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nome_fantasia"
    t.string "razao_social"
    t.string "cnpj"
    t.string "email"
    t.string "telefone"
    t.string "endereco"
    t.bigint "municipio_id", null: false
    t.bigint "status_empresa_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_empresas_on_municipio_id"
    t.index ["status_empresa_id"], name: "index_empresas_on_status_empresa_id"
  end

  create_table "entradas_estoque", force: :cascade do |t|
    t.bigint "empresa_id", null: false
    t.bigint "produto_id", null: false
    t.integer "quantidade", null: false
    t.decimal "preco_custo", precision: 10, scale: 2, null: false
    t.date "data_entrada", null: false
    t.text "observacao"
    t.integer "created_by"
    t.integer "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_entradas_estoque_on_empresa_id"
    t.index ["produto_id"], name: "index_entradas_estoque_on_produto_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.bigint "pais_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pais_id"], name: "index_estados_on_pais_id"
  end

  create_table "filiais", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.bigint "empresa_id", null: false
    t.bigint "municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_filiais_on_empresa_id"
    t.index ["municipio_id"], name: "index_filiais_on_municipio_id"
  end

  create_table "municipios", force: :cascade do |t|
    t.string "nome"
    t.bigint "estado_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_municipios_on_estado_id"
  end

  create_table "paises", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.bigint "empresa_id", null: false
    t.bigint "categoria_produto_id", null: false
    t.bigint "unidade_medida_id", null: false
    t.string "nome", null: false
    t.text "descricao"
    t.string "codigo_interno"
    t.string "codigo_barras"
    t.decimal "preco_custo", precision: 10, scale: 2
    t.decimal "preco_venda", precision: 10, scale: 2
    t.integer "estoque_minimo", default: 0
    t.boolean "ativo", default: true
    t.integer "created_by"
    t.integer "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_produto_id"], name: "index_produtos_on_categoria_produto_id"
    t.index ["empresa_id"], name: "index_produtos_on_empresa_id"
    t.index ["unidade_medida_id"], name: "index_produtos_on_unidade_medida_id"
  end

  create_table "status_empresas", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_usuarios", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades_medida", force: :cascade do |t|
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sigla"
    t.text "descricao"
  end

  add_foreign_key "bairros", "municipios"
  add_foreign_key "categoria_produtos", "empresas"
  add_foreign_key "distritos", "municipios"
  add_foreign_key "empresas", "municipios"
  add_foreign_key "empresas", "status_empresas"
  add_foreign_key "entradas_estoque", "empresas"
  add_foreign_key "entradas_estoque", "produtos"
  add_foreign_key "estados", "paises"
  add_foreign_key "filiais", "empresas"
  add_foreign_key "filiais", "municipios"
  add_foreign_key "municipios", "estados"
  add_foreign_key "produtos", "categoria_produtos"
  add_foreign_key "produtos", "empresas"
  add_foreign_key "produtos", "unidades_medida"
end
