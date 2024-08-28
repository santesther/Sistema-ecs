class AddUniqueIndexToRelatMunicipalOuParticularAditivos < ActiveRecord::Migration[7.0]
  def change
    # Remove o índice atual
    remove_index :relatmunicipalouparticularaditivos, :user_id if index_exists?(:relatmunicipalouparticularaditivos, :user_id)
   
    # Adiciona o novo índice com restrição de unicidade
    add_index :relatmunicipalouparticularaditivos, :user_id, unique: true
 end
end
