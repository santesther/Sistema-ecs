class CreateInstituicaos < ActiveRecord::Migration[7.0]
  def change
    create_table :instituicaos do |t|
      t.string :nome_da_instituicao
      t.integer :cnpj
      t.string :endereco_da_instituicao
      t.integer :numero_da_instituicao
      t.string :complemento_da_instituicao
      t.string :bairro_da_instituicao
      t.string :municipio_da_instituicao
      t.integer :cep_da_instituicao
      t.integer :telefone_da_instituicao
      t.string :representante
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
