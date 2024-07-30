class AddNomeSocialTermoToRelatestadual < ActiveRecord::Migration[7.0]
  def change
    add_column :relatestaduais, :nome_social_termo, :string
  end
end
