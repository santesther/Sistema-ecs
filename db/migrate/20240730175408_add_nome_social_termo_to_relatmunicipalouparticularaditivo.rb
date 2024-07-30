class AddNomeSocialTermoToRelatmunicipalouparticularaditivo < ActiveRecord::Migration[7.0]
  def change
    add_column :relatmunicipalouparticularaditivos, :nome_social_termo, :string
  end
end
