class AddNomeSocialTermoToRelatcampiaditivo < ActiveRecord::Migration[7.0]
  def change
    add_column :relatcampiaditivos, :nome_social_termo, :string
  end
end
