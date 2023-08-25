class CreateRegistroAvaliacaos < ActiveRecord::Migration[7.0]
  def change
    create_table :registro_avaliacaos do |t|
      t.integer :aluno_id, null: false
      t.string :nome_aluno, null: false
      t.string :status, null: false
      t.string :avaliador, null: false

      t.timestamps
    end
  end
end
