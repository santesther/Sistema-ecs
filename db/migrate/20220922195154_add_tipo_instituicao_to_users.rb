class AddTipoInstituicaoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tipoInstituicao, :string, null: false 
  end
end
