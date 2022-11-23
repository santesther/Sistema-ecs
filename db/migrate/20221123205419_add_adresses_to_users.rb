class AddAdressesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :endereco, :string
    add_column :users, :complemento, :string
    add_column :users, :numero, :string
    add_column :users, :bairro, :string
    add_column :users, :municipio, :string
    add_column :users, :cep, :string
  end
end
