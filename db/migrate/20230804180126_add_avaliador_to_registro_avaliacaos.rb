class AddAvaliadorToRegistroAvaliacaos < ActiveRecord::Migration[7.0]
  def change
    add_reference :registro_avaliacaos, :responsavel_avaliacao, foreign_key: { to_table: :users }
  end
end
