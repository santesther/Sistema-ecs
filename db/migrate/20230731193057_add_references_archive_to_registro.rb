class AddReferencesArchiveToRegistro < ActiveRecord::Migration[7.0]
  def change
    add_reference :registro_avaliacaos, :archive, null: false, column: :archive_id, foreign_key: true
  end
end
