class AddNomeSocialTermoToRelatpublico < ActiveRecord::Migration[7.0]
  def change
    add_column :relatpublicos, :nome_social_termo, :string
  end
end
