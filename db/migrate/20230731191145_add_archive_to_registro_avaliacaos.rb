class AddArchiveToRegistroAvaliacaos < ActiveRecord::Migration[7.0]
  def change
    add_column :registro_avaliacaos, :id_archive, :integer
  end
end
