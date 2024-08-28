class AddUniqueIndexToRelatCampis < ActiveRecord::Migration[7.0]
  def change
    # Remove o índice atual
    remove_index :relatcampis, :user_id if index_exists?(:relatcampis, :user_id)
   
    # Adiciona o novo índice com restrição de unicidade
    add_index :relatcampis, :user_id, unique: true
 end
end
