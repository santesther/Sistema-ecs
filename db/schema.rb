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

ActiveRecord::Schema[7.0].define(version: 2024_08_28_205615) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "avaliadors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carta_apresentacoes", force: :cascade do |t|
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "periodo"
    t.string "licenciatura"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "matricula_aluno"
    t.string "aluno_semestre"
    t.string "ano"
    t.string "endereco"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "estado_da_instituicao"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "apolice"
    t.string "seguradora"
    t.string "data"
    t.string "avaliador"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome_social_termo"
    t.integer "user_id"
    t.index ["user_id"], name: "index_carta_apresentacoes_on_user_id", unique: true
  end

  create_table "instituicaos", force: :cascade do |t|
    t.string "nome_da_instituicao"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "complemento_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "tipo_da_instituicao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mensagens", force: :cascade do |t|
    t.text "texto"
    t.bigint "destinatario_id"
    t.bigint "remetente_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["destinatario_id"], name: "index_mensagens_on_destinatario_id"
    t.index ["remetente_id"], name: "index_mensagens_on_remetente_id"
  end

  create_table "registro_avaliacaos", force: :cascade do |t|
    t.integer "aluno_id", null: false
    t.string "nome_aluno", null: false
    t.string "status", null: false
    t.string "avaliador", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "id_archive"
    t.bigint "responsavel_avaliacao_id"
    t.index ["responsavel_avaliacao_id"], name: "index_registro_avaliacaos_on_responsavel_avaliacao_id"
  end

  create_table "relataditivocentros", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "aluno_semestre"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "ano"
    t.string "endereco"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "estado_da_instituicao"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "licenciatura"
    t.string "periodo"
    t.string "avaliador"
    t.string "periodo_letivoperiodo_dirlic"
    t.string "semestre_dirlic"
    t.string "estagio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome_social_termo"
    t.integer "user_id"
    t.index ["user_id"], name: "index_relataditivocentros_on_user_id"
  end

  create_table "relatcampiaditivos", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "aluno_semestre"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "ano"
    t.string "endereco"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "estado_da_instituicao"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "licenciatura"
    t.string "periodo"
    t.string "avaliador"
    t.string "periodo_letivo"
    t.string "periodo_dirlic"
    t.string "semestre_dirlic"
    t.string "representante_da_instituicao"
    t.string "estagio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome_social_termo"
    t.integer "user_id"
    t.index ["user_id"], name: "index_relatcampiaditivos_on_user_id"
  end

  create_table "relatcampis", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "aluno_semestre"
    t.string "ano"
    t.string "estado"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "estado_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "numero"
    t.string "endereco"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "cep"
    t.string "telefone"
    t.string "licenciatura"
    t.string "periodo"
    t.string "avaliador"
    t.string "representante_da_instituicao"
    t.string "estagio"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome_social_termo"
    t.integer "user_id"
    t.index ["user_id"], name: "index_relatcampis_on_user_id"
  end

  create_table "relatestadualaditivos", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "aluno_semestre"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "ano"
    t.string "endereco"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "estado_da_instituicao"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "licenciatura"
    t.string "periodo"
    t.string "avaliador"
    t.string "periodo_letivo"
    t.string "periodo_dirlic"
    t.string "semestre_dirlic"
    t.string "representante_da_instituicao"
    t.string "estagio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome_social_termo"
    t.integer "user_id"
    t.index ["user_id"], name: "index_relatestadualaditivos_on_user_id", unique: true
  end

  create_table "relatmunicipalouparticularaditivos", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "aluno_semestre"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "ano"
    t.string "endereco"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "estado_da_instituicao"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "licenciatura"
    t.string "periodo"
    t.string "avaliador"
    t.string "periodo_letivo"
    t.string "periodo_dirlic"
    t.string "semestre_dirlic"
    t.string "representante_da_instituicao"
    t.string "estagio"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome_social_termo"
    t.integer "user_id"
    t.string "prefeitura"
    t.index ["user_id"], name: "index_relatmunicipalouparticularaditivos_on_user_id", unique: true
  end

  create_table "relatnaoformais", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "representante_da_instituicao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "estado_da_instituicao"
    t.string "aluno_apresentacao_tres"
    t.string "aluno_periodo"
    t.string "aluno_semestre"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "periodo"
    t.string "licenciatura"
    t.string "reitor"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "numero"
    t.string "ano"
    t.string "endereco"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "avaliador"
    t.string "estagio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_relatnaoformais_on_user_id"
  end

  create_table "relatnaoformals", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "representante_da_instituicao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "estado_da_instituicao"
    t.string "aluno_apresentacao_tres"
    t.string "aluno_periodo"
    t.string "aluno_semestre"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "periodo"
    t.string "licenciatura"
    t.string "reitor"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "numero"
    t.string "ano"
    t.string "endereco"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "avaliador"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relatorios", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "aluno_semestre"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "ano"
    t.string "endereco"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "estado_da_instituicao"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "licenciatura"
    t.string "periodo"
    t.string "avaliador"
    t.string "estagio"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome_social_termo"
    t.integer "user_id"
    t.index ["user_id"], name: "index_relatorios_on_user_id", unique: true
  end

  create_table "relatoutros", force: :cascade do |t|
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "periodo"
    t.string "licenciatura"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "reitor"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "estado_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "representante_da_instituicao"
    t.string "numero"
    t.string "aluno_semestre"
    t.string "aluno_periodo"
    t.string "ano"
    t.string "endereco"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "apolice"
    t.string "seguradora"
    t.string "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relatparticulares", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "estado_da_instituicao"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "periodo"
    t.string "licenciatura"
    t.string "reitor"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "representante_da_instituicao"
    t.string "numero"
    t.string "aluno_semestre"
    t.string "aluno_periodo"
    t.string "ano"
    t.string "endereco"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "avaliador"
    t.string "estagio"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome_social_termo"
    t.integer "user_id"
    t.string "prefeitura"
    t.index ["user_id"], name: "index_relatparticulares_on_user_id", unique: true
  end

  create_table "relatparticulars", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "estado_da_instituicao"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "periodo"
    t.string "licenciatura"
    t.string "reitor"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "representante_da_instituicao"
    t.string "numero"
    t.string "aluno_semestre"
    t.string "aluno_periodo"
    t.string "ano"
    t.string "endereco"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "avaliador"
    t.string "representante_da_instituicao_dois"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relatpublicos", force: :cascade do |t|
    t.string "data"
    t.string "seguradora"
    t.string "apolice"
    t.string "instituicao_apresentacao"
    t.string "aluno_apresentacao"
    t.string "aluno_apresentacao_dois"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "reitor"
    t.string "periodo_de"
    t.string "periodo_a"
    t.string "matricula_aluno"
    t.string "licenciatura"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "complemento_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "estado_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "numero"
    t.string "aluno_semestre"
    t.string "ano"
    t.string "endereco"
    t.string "complemento"
    t.string "bairro"
    t.string "municipio"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "avaliador"
    t.string "periodo"
    t.string "representante_da_instituicao"
    t.string "estagio"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome_social_termo"
    t.integer "user_id"
    t.index ["user_id"], name: "index_relatpublicos_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.string "licenciatura"
    t.string "nome"
    t.string "nome_social"
    t.string "nome_civil"
    t.string "semestre_apresentacao"
    t.string "ano_apresentacao"
    t.string "aluno_ano"
    t.string "matricula"
    t.string "estado_da_instituicao"
    t.string "seguradora"
    t.string "endereco"
    t.string "complemento"
    t.string "numero"
    t.string "bairro"
    t.string "municipio"
    t.string "cep"
    t.string "telefone"
    t.string "periodo"
    t.string "data"
    t.string "nome_da_instituicao"
    t.string "cnpj"
    t.string "endereco_da_instituicao"
    t.string "numero_da_instituicao"
    t.string "complemento_da_instituicao"
    t.string "bairro_da_instituicao"
    t.string "municipio_da_instituicao"
    t.string "cep_da_instituicao"
    t.string "telefone_da_instituicao"
    t.string "representante"
    t.string "tipo_da_instituicao"
    t.boolean "condicao"
    t.string "status", default: "Revisando", null: false
    t.string "signature"
    t.string "feedback_situacao"
    t.string "avatar"
    t.string "apolice"
    t.string "situacao", default: "Pendente"
    t.boolean "carta_apresentacao", default: false
    t.boolean "pdf_centro", default: false
    t.boolean "pdf_campi", default: false
    t.boolean "pdf_publico", default: false
    t.boolean "pdf_particular", default: false
    t.boolean "pdf_aditivo_centro", default: false
    t.boolean "pdf_aditivo_campi", default: false
    t.boolean "pdf_aditivo_estadual", default: false
    t.boolean "pdf_aditivo_municipalouparticular", default: false
    t.boolean "status_impressao", default: false
    t.string "finalizacao", default: "Revisando"
    t.boolean "pdf_naoformal", default: false
    t.string "liberacao", default: "Reprovado"
    t.boolean "status_carta", default: false
    t.string "uf"
    t.string "avaliador_nome"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "mensagens", "users", column: "destinatario_id"
  add_foreign_key "mensagens", "users", column: "remetente_id"
  add_foreign_key "registro_avaliacaos", "users", column: "responsavel_avaliacao_id"
end
