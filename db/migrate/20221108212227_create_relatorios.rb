class CreateRelatorios < ActiveRecord::Migration[7.0]
  def change
    create_table :relatorios do |t|
      t.string :representado_por
      t.string :semestre
      t.string :ano
      t.string :endereco
      t.string :bairro
      t.string :municipio
      t.string :estado
      t.string :cep
      t.string :periodo_de
      t.string :periodo_a
      t.string :nome
      t.string :matricula_aluno
      t.string :periodo
      t.string :licenciatura

      t.timestamps
    end
  end
end
