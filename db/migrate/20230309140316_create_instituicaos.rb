class CreateInstituicaos < ActiveRecord::Migration[7.0]
  def change
    create_table :instituicaos do |t|
      t.string :nome_da_instituicao
      t.string :cnpj
      t.string :endereco_da_instituicao
      t.string :numero_da_instituicao
      t.string :complemento_da_instituicao
      t.string :bairro_da_instituicao
      t.string :municipio_da_instituicao
      t.string :cep_da_instituicao
      t.string :telefone_da_instituicao
      t.string :representante
      t.string :tipo_da_instituicao

      t.timestamps
    end
  end
end
