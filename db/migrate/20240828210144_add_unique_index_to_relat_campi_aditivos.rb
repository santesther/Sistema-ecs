class AddUniqueIndexToRelatCampiAditivos < ActiveRecord::Migration[7.0]
  def change
    # Remove o índice atual
    remove_index :relatcampiaditivos, :user_id if index_exists?(:relatcampiaditivos, :user_id)
   
    # Adiciona o novo índice com restrição de unicidade
    add_index :relatcampiaditivos, :user_id, unique: true
 end
end
