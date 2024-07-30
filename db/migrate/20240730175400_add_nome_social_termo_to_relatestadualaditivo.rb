class AddNomeSocialTermoToRelatestadualaditivo < ActiveRecord::Migration[7.0]
  def change
    add_column :relatestadualaditivos, :nome_social_termo, :string
  end
end
