class CreateRelatnaoformals < ActiveRecord::Migration[7.0]
  def change
    create_table :relatnaoformals do |t|
      t.string :instituicao_apresentacao
      t.string :aluno_apresentacao
      t.string :aluno_apresentacao_dois
      t.string :periodo
      t.string :licenciatura
      t.string :semestre_apresentacao
      t.string :ano_apresentacao
      t.string :reitor
      t.string :cnpj
      t.string :endereco_da_instituicao
      t.string :numero_da_instituicao
      t.string :bairro_da_instituicao
      t.string :municipio_da_instituicao
      t.string :estado_da_instituicao
      t.string :cep_da_instituicao
      t.string :telefone_da_instituicao
      t.string :representante
      t.string :numero
      t.string :aluno_semestre
      t.string :ano
      t.string :endereco
      t.string :complemento
      t.string :bairro
      t.string :municipio
      t.string :estado
      t.string :cep
      t.string :telefone
      t.string :periodo_de
      t.string :periodo_a
      t.string :matricula_aluno
      t.string :apolice
      t.string :seguradora

      t.timestamps
    end
  end
end
