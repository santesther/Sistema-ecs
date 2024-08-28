class AddUniqueIndexToRelatAditivoCentros < ActiveRecord::Migration[7.0]
  def change
    # Remove o índice atual
    remove_index :relataditivocentros, :user_id if index_exists?(:relataditivocentros, :user_id)
   
    # Adiciona o novo índice com restrição de unicidade
    add_index :relataditivocentros, :user_id, unique: true
 end
end
