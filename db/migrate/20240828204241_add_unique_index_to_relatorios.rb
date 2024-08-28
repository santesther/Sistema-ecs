class AddUniqueIndexToRelatorios < ActiveRecord::Migration[7.0]
  def change
    # Remove o índice atual
    remove_index :relatorios, :user_id if index_exists?(:relatorios, :user_id)
   
    # Adiciona o novo índice com restrição de unicidade
    add_index :relatorios, :user_id, unique: true
 end
end
