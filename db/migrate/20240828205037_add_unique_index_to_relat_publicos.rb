class AddUniqueIndexToRelatPublicos < ActiveRecord::Migration[7.0]
  def change
    # Remove o índice atual
    remove_index :relatpublicos, :user_id if index_exists?(:relatpublicos, :user_id)
   
    # Adiciona o novo índice com restrição de unicidade
    add_index :relatpublicos, :user_id, unique: true
 end
end
