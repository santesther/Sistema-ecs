class AddNomeSocialTermoToRelatparticular < ActiveRecord::Migration[7.0]
  def change
    add_column :relatparticulares, :nome_social_termo, :string
  end
end
