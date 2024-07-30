class AddNomeSocialTermoToRelataditivocentro < ActiveRecord::Migration[7.0]
  def change
    add_column :relataditivocentros, :nome_social_termo, :string
  end
end
