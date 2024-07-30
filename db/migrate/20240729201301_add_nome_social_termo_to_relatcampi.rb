class AddNomeSocialTermoToRelatcampi < ActiveRecord::Migration[7.0]
  def change
    add_column :relatcampis, :nome_social_termo, :string
  end
end
