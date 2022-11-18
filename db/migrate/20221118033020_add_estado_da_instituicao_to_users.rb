class AddEstadoDaInstituicaoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :estado_da_instituicao, :string
  end
end
