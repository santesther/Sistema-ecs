class AddUniqueIndexToRelatEstadualAditivos < ActiveRecord::Migration[7.0]
  def change
    # Remove o índice atual
    remove_index :relatestadualaditivos, :user_id if index_exists?(:relatestadualaditivos, :user_id)
   
    # Adiciona o novo índice com restrição de unicidade
    add_index :relatestadualaditivos, :user_id, unique: true
 end
end
