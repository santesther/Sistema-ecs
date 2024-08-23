class AddUniqueIndexToCartaApresentacoes < ActiveRecord::Migration[7.0]
  def change
    # Remove o índice atual
    remove_index :carta_apresentacoes, :user_id if index_exists?(:carta_apresentacoes, :user_id)
    
    # Adiciona o novo índice com restrição de unicidade
    add_index :carta_apresentacoes, :user_id, unique: true
  end
end
