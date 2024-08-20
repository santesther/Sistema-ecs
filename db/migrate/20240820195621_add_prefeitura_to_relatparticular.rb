class AddPrefeituraToRelatparticular < ActiveRecord::Migration[7.0]
  def change
    add_column :relatparticulares, :prefeitura, :string
  end
end
