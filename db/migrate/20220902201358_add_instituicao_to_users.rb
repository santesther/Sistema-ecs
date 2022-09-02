class AddInstituicaoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nome_da_instituicao, :string
    add_column :users, :cnpj, :integer
    add_column :users, :endereco_da_instituicao, :string
    add_column :users, :numero_da_instituicao, :integer
    add_column :users, :complemento_da_instituicao, :string
    add_column :users, :bairro_da_instituicao, :string
    add_column :users, :municipio_da_instituicao, :string
    add_column :users, :cep_da_instituicao, :integer
    add_column :users, :telefone_da_instituicao, :integer
    add_column :users, :representante, :string
    add_reference :users, :user, null: false, foreign_key: true
  end
end
