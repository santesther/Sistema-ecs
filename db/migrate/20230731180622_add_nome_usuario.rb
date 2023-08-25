class AddNomeUsuario < ActiveRecord::Migration[7.0]
  def change
    add_column :archives, :nome_usuario, :string
  end
end
