class AddNomeSocialTermoToCartaApresentacao < ActiveRecord::Migration[7.0]
  def change
    add_column :carta_apresentacoes, :nome_social_termo, :string
  end
end
