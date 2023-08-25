class AddReferencesUserToRegistro < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :registro_avaliacaos, :users, column: :aluno_id
  end
end
