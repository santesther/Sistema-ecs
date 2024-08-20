class AddPrefeituraToRelatmunicipalouparticularaditivo < ActiveRecord::Migration[7.0]
  def change
    add_column :relatmunicipalouparticularaditivos, :prefeitura, :string
  end
end
