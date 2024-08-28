class AddUniqueIndexToRelatParticulares < ActiveRecord::Migration[7.0]
  def change
     # Remove o índice atual
     remove_index :relatparticulares, :user_id if index_exists?(:relatparticulares, :user_id)
    
     # Adiciona o novo índice com restrição de unicidade
     add_index :relatparticulares, :user_id, unique: true
  end
end
