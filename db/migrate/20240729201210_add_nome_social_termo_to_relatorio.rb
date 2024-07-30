class AddNomeSocialTermoToRelatorio < ActiveRecord::Migration[7.0]
  def change
    add_column :relatorios, :nome_social_termo, :string
  end
end
