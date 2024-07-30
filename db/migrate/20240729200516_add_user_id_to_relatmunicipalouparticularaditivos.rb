class AddUserIdToRelatmunicipalouparticularaditivos < ActiveRecord::Migration[7.0]
  def change
    add_column :relatmunicipalouparticularaditivos, :user_id, :integer
    add_index :relatmunicipalouparticularaditivos, :user_id
  end
end
