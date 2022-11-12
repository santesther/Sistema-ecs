class CreateRelatorios < ActiveRecord::Migration[7.0]
  def change
    create_table :relatorios do |t|
      t.string :instituicao_apresentacao
      t.string :aluno_apresentacao
      t.string :aluno_apresentacao_dois
      t.string :periodo
      t.string :licenciatura
      t.string :semestre_apresentacao
      t.string :ano_apresentacao
      t.string :matricula_aluno
      t.string :aluno_semestre
      t.string :ano
      t.string :endereco
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :municipio
      t.string :estado
      t.string :cep
      t.string :telefone
      t.string :periodo_de
      t.string :periodo_a

      t.timestamps
    end
  end
end
